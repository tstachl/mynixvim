{
  plugins.telescope = {
    enable = true;
    settings.pickers.find_files.follow = true;
    keymaps = {
      "<leader>e" = "find_files";
      "<C-p>" = "git_files";
      "<leader>gs" = "grep_string";
      "<leader>lg" = "live_grep";
      "<leader>vh" = "help_tags";
    };
    extensions.fzf-native.enable = true;
  };
}
