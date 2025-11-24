---@brief
---
--- https://github.com/antonWetzel/typst-languagetool
---
--- `typst-languagetool` is a language server for spell and grammar checking of Typst documents with LanguageTool.
---
--- It provides real-time grammar and spell checking for Typst documents by extracting text content
--- and running it through LanguageTool. The server supports multiple backends:
--- - `jar`: Uses a local LanguageTool JAR file (requires JDK)
--- - `server`: Connects to a remote LanguageTool server
--- - `bundle`: Uses a bundled LanguageTool JAR (if built with bundle feature)
---
--- The default configuration uses the `jar` backend, which works well with Nix-installed packages.
--- For manual configuration, you can override `init_options` to specify the backend and other settings.
---
--- Example minimal configuration:
--- ```lua
--- vim.lsp.enable('typst_languagetool')
--- ```
---
--- Example with jar backend:
--- ```lua
--- vim.lsp.enable('typst_languagetool', {
---   init_options = {
---     backend = 'jar',
---     jar_location = '/path/to/languagetool-server.jar'
---   }
--- })
--- ```
---
--- Example with remote server backend:
--- ```lua
--- vim.lsp.enable('typst_languagetool', {
---   init_options = {
---     backend = 'server',
---     host = 'localhost',
---     port = '8081'
---   }
--- })
--- ```

---@type vim.lsp.Config
return {
  cmd = { 'typst-languagetool-lsp' },
  filetypes = { 'typst', 'typ' },
  root_markers = { '.git', 'main.typ' },
  init_options = {
    -- Default configuration - no backend specified
    -- Users should configure one of the backends:
    --
    -- For jar backend (requires LanguageTool JAR):
    --   backend = 'jar',
    --   jar_location = '/path/to/languagetool-server.jar',
    --
    -- For remote server backend:
    --   backend = 'server',
    --   host = 'localhost',
    --   port = '8081',
    --
    -- For bundle backend (if built with bundle feature):
    --   backend = 'bundle',
    chunk_size = 1000,
    languages = {},
    dictionary = {},
    disabled_checks = {},
    ignore_functions = {},
  },
}
