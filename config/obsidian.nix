{ pkgs, ... }:
{
  keymaps = [
    { key = "<leader>ot"; action = ":ObsidianToday<cr>"; mode = "n"; }
    { key = "<leader>on"; action = ":ObsidianNew<cr>"; mode = "n"; }
    { key = "<leader>os"; action = ":ObsidianSearch<cr>"; mode = "n"; }
  ];

  plugins.obsidian.enable = true;

  plugins.obsidian.settings = {
    daily_notes = {
      folder = "daily";
      date_format = "%Y-%m-%d";
      alias_format = "%B %-d, %Y";
      template = "daily.md";
    };

    new_notes_location = "notes_subdir";

    note_id_func = ''
      function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date('%Y%m%d%H%M')) .. "-" .. suffix
      end
    '';

    templates = {
      folder = "templates";
      date_format = "%Y-%m-%d";
      time_format = "%H:%M";
      substitutions = {
        "date:YYYY-MM-DD".__raw = ''
          function()
            return os.date("%Y-%m-%d", os.time())
          end
        '';

        "date:MMMM D, YYYY".__raw = ''
          function()
            return os.date("%B %d, %Y", os.time()):gsub(" 0", " ")
          end
        '';

        yesterday.__raw = ''
          function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end
        '';

        tomorrow.__raw = ''
          function()
            return os.date("%Y-%m-%d", os.time() + 86400)
          end
        '';
      };
    };

    workspaces = [{
      name = "Notes";
      path = "/Users/thomas/Obsidian/Notes";
      overrides = {
        notes_subdir = "notes";
      };
    }];
  };

  extraPlugins = with pkgs.vimPlugins; [ wrapping-nvim ];
  extraConfigLua = ''
    require("wrapping").setup({
      auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "mail",
        "markdown",
        "rst",
        "tex",
        "text",
      },
      softener = { markdown = true },
    })
  '';
}
