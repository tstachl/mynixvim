{
  keymaps = [
    { key = "K"; action = ":m '<-2<CR>gv=gv"; mode = "v"; }
    { key = "J"; action = ":m '>+1<CR>gv=gv"; mode = "v"; }

    { key = "J"; action = "mzJ`z"; mode = "n"; }
    { key = "<C-d>"; action = "<C-d>zz"; mode = "n"; }
    { key = "<C-u>"; action = "<C-u>zz"; mode = "n"; }
    { key = "n"; action = "nzzzv"; mode = "n"; }
    { key = "N"; action = "Nzzzv"; mode = "n"; }

    {
      key = "<C-h>";
      action.__raw = "vim.lsp.buf.signature_help";
      mode = "i";
    }

    # Obsidian Mappings
    { key = "<leader>ot"; action = ":ObsidianToday<cr>"; mode = "n"; }
    { key = "<leader>on"; action = ":ObsidianNew<cr>"; mode = "n"; }
    { key = "<leader>os"; action = ":ObsidianSearch<cr>"; mode = "n"; }
  ];
}
