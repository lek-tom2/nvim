-- Arduino support: language server, treesitter, and arduino-cli build/upload keymaps.
--
-- System requirements (Arch): arduino-cli arduino-language-server avr-gcc avr-libc avrdude
--   arduino-cli core install arduino:avr
--
-- Override the board per project with a .nvim.lua / exrc or globally:
--   vim.g.arduino_fqbn = "arduino:avr:nano"
--   vim.g.arduino_port = "/dev/ttyUSB0"   -- optional, autodetected otherwise

local function fqbn()
  return vim.g.arduino_fqbn or "arduino:avr:uno"
end

local function sketch_dir()
  return vim.fn.expand("%:p:h")
end

local function detect_port()
  if vim.g.arduino_port then
    return vim.g.arduino_port
  end
  local out = vim.fn.system({ "arduino-cli", "board", "list", "--json" })
  local ok, data = pcall(vim.json.decode, out)
  if ok and type(data) == "table" then
    for _, p in ipairs(data.detected_ports or {}) do
      if p.port and p.port.protocol == "serial" then
        return p.port.address
      end
    end
  end
  for _, pat in ipairs({ "/dev/ttyACM*", "/dev/ttyUSB*" }) do
    local found = vim.fn.glob(pat, true, true)
    if #found > 0 then
      return found[1]
    end
  end
  return nil
end

local function run_term(cmd)
  vim.cmd("botright 15split")
  vim.fn.jobstart(cmd, { term = true })
  vim.cmd("startinsert")
end

local function compile()
  vim.cmd("silent! wall")
  run_term({ "arduino-cli", "compile", "--fqbn", fqbn(), sketch_dir() })
end

local function upload()
  vim.cmd("silent! wall")
  local port = detect_port()
  if not port then
    vim.notify("Arduino: no serial port found (set vim.g.arduino_port)", vim.log.levels.ERROR)
    return
  end
  run_term({ "arduino-cli", "upload", "-p", port, "--fqbn", fqbn(), sketch_dir() })
end

local function compile_upload()
  vim.cmd("silent! wall")
  local port = detect_port()
  if not port then
    vim.notify("Arduino: no serial port found (set vim.g.arduino_port)", vim.log.levels.ERROR)
    return
  end
  run_term({ "arduino-cli", "compile", "-u", "-p", port, "--fqbn", fqbn(), sketch_dir() })
end

local function monitor()
  local port = detect_port()
  if not port then
    vim.notify("Arduino: no serial port found (set vim.g.arduino_port)", vim.log.levels.ERROR)
    return
  end
  local baud = vim.g.arduino_baud or 9600
  run_term({ "arduino-cli", "monitor", "-p", port, "--config", "baudrate=" .. baud })
end

local function set_fqbn()
  local out = vim.fn.system({ "arduino-cli", "board", "listall", "--json" })
  local ok, data = pcall(vim.json.decode, out)
  if not ok or type(data) ~= "table" then
    vim.notify("Arduino: could not list boards", vim.log.levels.ERROR)
    return
  end
  local boards = {}
  for _, b in ipairs(data.boards or {}) do
    table.insert(boards, { name = b.name, fqbn = b.fqbn })
  end
  table.sort(boards, function(a, b)
    return a.name < b.name
  end)
  vim.ui.select(boards, {
    prompt = "Select Arduino board (current: " .. fqbn() .. ")",
    format_item = function(b)
      return b.name .. "  [" .. b.fqbn .. "]"
    end,
  }, function(choice)
    if choice then
      vim.g.arduino_fqbn = choice.fqbn
      vim.notify("Arduino board set to " .. choice.fqbn .. " (restart LSP with :LspRestart)")
    end
  end)
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "arduino", "c", "cpp" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {
          mason = false, -- use the system package (pacman -S arduino-language-server)
          cmd = {
            "arduino-language-server",
            "-cli", "arduino-cli",
            "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-clangd", "clangd",
            "-fqbn", fqbn(),
          },
          filetypes = { "arduino" },
          root_markers = { "sketch.yaml", "*.ino", ".git" },
          capabilities = {
            textDocument = {
              semanticTokens = vim.NIL,
            },
            workspace = {
              semanticTokens = vim.NIL,
            },
          },
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "arduino", icon = { icon = "", color = "cyan" } },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "arduino",
        callback = function(ev)
          vim.bo[ev.buf].commentstring = "// %s"
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
          end
          map("<leader>ac", compile, "Arduino: compile")
          map("<leader>au", upload, "Arduino: upload")
          map("<leader>aa", compile_upload, "Arduino: compile + upload")
          map("<leader>am", monitor, "Arduino: serial monitor")
          map("<leader>ab", set_fqbn, "Arduino: select board")
          map("<leader>ap", function()
            vim.notify("Arduino port: " .. (detect_port() or "none") .. "\nBoard: " .. fqbn())
          end, "Arduino: show port/board")
        end,
      })
    end,
  },
}
