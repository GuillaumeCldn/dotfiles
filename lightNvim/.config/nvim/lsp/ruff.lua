return {
  name = 'ruff',
  cmd = { 'ruff', 'server' },
  root_markers = { 'ruff.toml', 'pyproject.toml', '.git' },
  filetypes = { 'python' },
  init_options = {
    settings = {
      -- Any specific ruff settings (usually handled by ruff.toml)
    }
  },
}
