{
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./obsidian.nix
    ./telescope.nix
    ./treesitter.nix
    ./zenmode.nix
    ./wrapping.nix
  ];

  plugins = {
    auto-session.enable = true;
    comment.enable = true;
    tmux-navigator.enable = true;
    fidget.enable = true;
  };
}
