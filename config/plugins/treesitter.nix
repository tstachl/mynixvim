{
  plugins.treesitter = {
    enable = true;
    ensureInstalled = "all";
    indent = true;
    nixvimInjections = true;
  };
  plugins.treesitter-context.enable = true;
}
