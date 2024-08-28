{
  keymaps = [
    {
      key = "<leader>f";
      action.__raw = ''
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end
      '';
      options.desc = "[F]ormat buffer";
    }
  ];

  plugins.conform-nvim = {
    enable = true;
    formattersByFt = {
      lua = [ "lua_ls" ];
      javascript = [ [ "prettierd" "prettier" ] [ "eslint_d" "eslint" ] ];
      typescript = [ [ "prettierd" "prettier" ] [ "eslint_d" "eslint" ] ];
    };
    notifyOnError = false;
  };
}
