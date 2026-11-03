-- Common
local disabled = { enabled = false }

-- C/C++/CMake
local neocmake = {}
local clangd = {
  keys = {
    { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
  },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    "configure.ac", -- AutoTools
    "Makefile",
    "configure.ac",
    "configure.in",
    "config.h.in",
    "meson.build",
    "meson_options.txt",
    "build.ninja",
    ".git",
  },
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
}

-- Python
local ruff = {
  cmd_env = { RUFF_TRACE = "messages" },
  init_options = {
    settings = {
      logLevel = "error",
    },
  },
}
local basedpyright = {}
local pylsp = {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
      },
    },
  },
}
local ty = {}

-- JavaScript/TypeScript
local tailwindcss = {}
local tsgo = {}
local prismals = {}

-- Kotlin
local kotlin_lsp = {}

-- Gradle
local gradle_ls = {
  filetypes = { "groovy", "kotlin" },
  root_markers = {
    "settings.gradle", -- Gradle (multi-project)
    "build.gradle", -- Gradle
    "settings.gradle.kts",
    "build.gradle.kts",
  },
}

-- Rust
local rust_analyzer = {}

if true then
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          neocmake = neocmake,
          clangd = clangd,
          ruff = ruff,
          -- basedpyright = basedpyright,
          pylsp = disabled,
          pyright = disabled,
          ty = ty,
          tailwindcss = tailwindcss,
          -- vtsls = disabled,
          tsgo = tsgo,
          prismals = prismals,
          -- jdtls = disabled,
          kotlin_lsp = kotlin_lsp,
          -- kotlin_language_server = disabled,
          -- gradle_ls = gradle_ls,
          rust_analyzer = rust_analyzer,
        },
        setup = {
          ruff = function()
            Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end)
          end,
          -- jdtls = function()
          -- return true -- avoid duplicate servers
          -- end,
        },
      },
    },
  }
else
  return {}
end
