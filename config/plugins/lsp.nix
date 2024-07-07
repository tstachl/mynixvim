{
  keymaps = [
    {
      key = "<C-h>";
      action.__raw = "vim.lsp.buf.signature_help";
      mode = "i";
    }
  ];

  plugins.lsp = {
    enable = true;
    onAttach = ''
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.buf.inlay_hint(bufnr, true)
      end
    '';

    keymaps = {
      diagnostic = {
        "<leader>vd" = "open_float";
        "[d" = "goto_next";
        "]d" = "goto_prev";
      };

      lspBuf = {
        "<leader>f" = "format";
        "gd" = "definition";
        "K" = "hover";
        "<leader>vws" = "workspace_symbol";
        "<leader>vca" = "code_action";
        "<leader>vrr" = "references";
        "<leader>vrn" = "rename";
      };
    };

    servers = {
      bashls.enable = true;

      denols = {
        enable = true;
        rootDir = "require('lspconfig').util.root_pattern('deno.json')";
        extraOptions.init_options = {
          lint = true;
          unstable = true;
        };
      };

      elixirls.enable = true;

      nil-ls.enable = true;

      tailwindcss.enable = true;

      tsserver = {
        enable = true;
        extraOptions.single_file_support = false;
        rootDir = ''
          require('lspconfig').util.root_pattern("tsconfig.json")
          '';
      };

      volar = {
        enable = true;
        rootDir = ''
          require('lspconfig').util.root_pattern("vite.config.mts")
          '';
      };
    };
  };
}
