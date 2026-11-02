-- Arduino support: language server, treesitter, and arduino-cli build/upload keymaps.
--
-- System requirements (Arch): arduino-cli arduino-language-server avr-gcc avr-libc avrdude
--   arduino-cli core install arduino:avr
--
-- Override the board per project with a .nvim.lua / exrc or globally:
--   vim.g.arduino_fqbn = "arduino:avr:nano"
--   vim.g.arduino_port = "/dev/ttyUSB0"   -- optional, autodetected otherwise
--
-- Libraries live in ~/Arduino/libraries (arduino-cli lib install "<Name>").
-- Restart the server after installing one: <leader>ar or :lsp restart (Neovim 0.12 syntax).

local function fqbn()
  return vim.g.arduino_fqbn or "arduino:avr:uno"
end

local function lsp_cmd()
  return {
    "arduino-language-server",
    "-cli", "arduino-cli",
    "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
    "-clangd", "clangd",
    "-fqbn", fqbn(),
  }
end

local function restart_lsp()
  vim.lsp.config("arduino_language_server", { cmd = lsp_cmd() })
  vim.cmd("lsp restart arduino_language_server")
  vim.notify("Arduino LSP restarted (board: " .. fqbn() .. ")")
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

-- arduino-cli requires the main file to be named after its folder: Foo/Foo.ino.
-- Otherwise the language server's startup build fails and the server quits silently.
local function sketch_problem(buf)
  local path = vim.api.nvim_buf_get_name(buf)
  if path == "" or not path:match("%.ino$") then
    return nil
  end
  local dir = vim.fn.fnamemodify(path, ":p:h")
  local dirname = vim.fn.fnamemodify(dir, ":t")
  local expected = dir .. "/" .. dirname .. ".ino"
  if vim.fn.filereadable(expected) == 1 then
    return nil
  end
  return expected
end

local function fix_sketch_name(buf)
  local expected = sketch_problem(buf)
  if not expected then
    vim.notify("Arduino: sketch layout is already correct")
    return
  end
  local path = vim.api.nvim_buf_get_name(buf)
  local others = vim.fn.glob(vim.fn.fnamemodify(path, ":p:h") .. "/*.ino", true, true)
  if #others > 1 then
    vim.notify("Arduino: several .ino files here, rename one to " .. vim.fn.fnamemodify(expected, ":t") .. " manually", vim.log.levels.WARN)
    return
  end
  vim.cmd("silent! write")
  local ok, err = os.rename(path, expected)
  if not ok then
    vim.notify("Arduino: rename failed: " .. tostring(err), vim.log.levels.ERROR)
    return
  end
  vim.cmd("edit " .. vim.fn.fnameescape(expected))
  vim.cmd("silent! bwipeout! " .. buf)
  vim.notify("Arduino: renamed to " .. vim.fn.fnamemodify(expected, ":t") .. ", LSP starting")
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
      restart_lsp()
    end
  end)
end

local function lib_list()
  local out = vim.fn.system({ "arduino-cli", "lib", "list", "--json" })
  local ok, data = pcall(vim.json.decode, out)
  if not ok or type(data) ~= "table" then
    vim.notify("Arduino: could not list libraries", vim.log.levels.ERROR)
    return
  end
  local libs = {}
  for _, l in ipairs(data.installed_libraries or {}) do
    local lib = l.library or {}
    table.insert(libs, { name = lib.name or "?", version = lib.version or "", dir = lib.install_dir or "" })
  end
  table.sort(libs, function(a, b)
    return a.name < b.name
  end)
  if #libs == 0 then
    vim.notify("Arduino: no libraries installed (use <leader>aL to install)", vim.log.levels.WARN)
    return
  end
  vim.ui.select(libs, {
    prompt = "Installed Arduino libraries (" .. #libs .. ") - pick one to open its examples/src",
    format_item = function(l)
      return l.name .. "  " .. l.version
    end,
  }, function(choice)
    if choice and choice.dir ~= "" then
      vim.cmd("edit " .. vim.fn.fnameescape(choice.dir))
    end
  end)
end

local function lib_install()
  vim.ui.input({ prompt = "Search Arduino library: " }, function(query)
    if not query or query == "" then
      return
    end
    local out = vim.fn.system({ "arduino-cli", "lib", "search", "--names", "--json", query })
    local ok, data = pcall(vim.json.decode, out)
    if not ok or type(data) ~= "table" or #(data.libraries or {}) == 0 then
      vim.notify("Arduino: no libraries found for '" .. query .. "'", vim.log.levels.WARN)
      return
    end
    local names = {}
    for _, l in ipairs(data.libraries) do
      table.insert(names, l.name)
    end
    vim.ui.select(names, { prompt = "Install library" }, function(name)
      if not name then
        return
      end
      run_term({ "arduino-cli", "lib", "install", name })
      vim.notify("After install finishes, press <leader>ar to restart the Arduino LSP")
    end)
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
          cmd = lsp_cmd(),
          filetypes = { "arduino" },
          root_dir = function(bufnr, on_dir)
            if sketch_problem(bufnr) then
              return
            end
            on_dir(vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p:h"))
          end,
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
          local expected = sketch_problem(ev.buf)
          if expected then
            vim.schedule(function()
              vim.notify(
                "Arduino: LSP will not start. The main file must be named after its folder:\n  "
                  .. vim.fn.fnamemodify(expected, ":t")
                  .. "\nPress <leader>af to rename it.",
                vim.log.levels.WARN,
                { title = "Arduino", timeout = 10000 }
              )
            end)
          end
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
          end
          map("<leader>ac", compile, "Arduino: compile")
          map("<leader>au", upload, "Arduino: upload")
          map("<leader>aa", compile_upload, "Arduino: compile + upload")
          map("<leader>am", monitor, "Arduino: serial monitor")
          map("<leader>ab", set_fqbn, "Arduino: select board")
          map("<leader>ar", restart_lsp, "Arduino: restart LSP")
          map("<leader>af", function()
            fix_sketch_name(ev.buf)
          end, "Arduino: fix sketch file name")
          map("<leader>al", lib_list, "Arduino: list installed libraries")
          map("<leader>aL", lib_install, "Arduino: search + install library")
          map("<leader>ap", function()
            vim.notify("Arduino port: " .. (detect_port() or "none") .. "\nBoard: " .. fqbn())
          end, "Arduino: show port/board")
        end,
      })
    end,
  },
}
