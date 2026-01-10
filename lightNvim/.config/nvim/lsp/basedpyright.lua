return {
  name = 'basedpyright',
  cmd = { 'basedpyright-langserver', '--stdio' },
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
  filetypes = { 'python' },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'standard', -- Options: off, basic, standard, strict, all
      },
    },
  },
}
