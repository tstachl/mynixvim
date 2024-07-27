{
  plugins.treesitter = {
    enable = true;
    settings.auto_install = true;
    settings.indent.enable = true;
    nixvimInjections = true;
  };
  plugins.treesitter-context.enable = true;
}
