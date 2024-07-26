{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ elixir-tools-nvim ];
  extraConfigLua = ''
    require("elixir").setup()
  '';
}
