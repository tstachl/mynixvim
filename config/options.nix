{
  globals.mapleader = " ";

  opts = {
    guicursor = "";

    number = true;
    relativenumber = true;

    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;

    smartindent = true;

    wrap = false;

    swapfile = false;
    backup = false;
    # TODO(@tstachl): this only works on a homemanager config
    # undodir = "${config.xdg.dataHome}/nvim/undodir";
    # undofile = true;

    hlsearch = false;
    incsearch = true;

    termguicolors = true;

    scrolloff = 8;
    signcolumn = "yes";
    isfname = [ "@-@" ];

    updatetime = 50;

    colorcolumn = "80";
  };
}
