{
  plugins.treesitter = {
    enable = true;
    settings.ensure_installed = "all";
    settings.indent.enable = true;
    nixvimInjections = true;
  };
  plugins.treesitter-context.enable = true;
}
