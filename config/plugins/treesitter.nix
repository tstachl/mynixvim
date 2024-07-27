{
  plugins.treesitter = {
    enable = true;
    settings.ensure_installed = "all";
    settings.ignore_install = [ "norg" ];
    settings.highlight.enable = true;
    settings.incremental_selection.enable = true;
    settings.indent.enable = true;
    nixvimInjections = true;
  };
  plugins.treesitter-context.enable = true;
}
