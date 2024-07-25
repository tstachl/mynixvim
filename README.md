# My Nixvim Configuration

This configuration sets up my basic `nvim` configuration. Additionally it specifies specific configurations for coding and writing.

```bash
# to run with the editor configuration
nix run .#editor
```

```bash
# to run with the writing configuration including obsidian plugin
nix run .#obsidian
```

## Default Configuration (for both)

### Options

I tend to use the same options accross all my configurations.

### Keymaps

This one is tricky, I use the same basic key maps accross configs, **but** there are some additional keymaps I use based on the plugins. For example, my obsidian plugin has additional keymaps that are super specific to obsidian.

### Colorschemes

It's probably time to switch to a new color scheme at some point but in general this also stays the same accross all my configurations.

### Plugins

- Tree Sitter
- Telescope
- Zen Mode

## Editor Config

### Plugins

- LSP
- CMP (Autocomplete)
- Formatter (conform)
- Lint with credo
- Test runner (vim-test neotest)
- Tab bar (lualine)
- File manager (maybe include ranger - oil.nvim)

## Obsidian Config

Need to figure out some better way of doing this but I def don't want the Obsidian configuration in my standard `nvim` configuration.

