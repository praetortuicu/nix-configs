{
  programs.nixvim = {
    colorschemes.gruvbox.enable = false;

  extraConfigLua = ''
    -- SHODAN custom colorscheme
    local shodan = {}

    shodan.palette = {
      bg       = "#00060A",
      bg_alt   = "#0A0F12",
      fg       = "#C4D7D1",
      fg_alt   = "#8BA39A",

      blue     = "#2F5C88",
      green    = "#2C7A55",
      cyan     = "#4FA3A1",

      warning  = "#A0A040",
      error    = "#A04040",
      info     = "#6FA0C0",
      hint     = "#4F8F7A",

      comment  = "#4F5A5C",
    }

    function shodan.setup()
      local p = shodan.palette

      local hl = vim.api.nvim_set_hl

      -- Core UI
      hl(0, "Normal",       { fg=p.fg, bg=p.bg })
      hl(0, "NormalFloat",  { fg=p.fg, bg="none" })
      hl(0, "FloatBorder",  { fg=p.blue, bg="none" })
      hl(0, "LineNr",       { fg=p.fg_alt })
      hl(0, "CursorLine",   { bg="#0A1014" })
      hl(0, "Pmenu",        { bg="#0E151A" })
      hl(0, "StatusLine",   { bg="#0D1419" })

      -- Syntax
      hl(0, "Comment",      { fg=p.comment, italic=true })
      hl(0, "Keyword",      { fg=p.blue })
      hl(0, "String",       { fg=p.green })
      hl(0, "Function",     { fg=p.blue })
      hl(0, "Parameter",    { fg=p.fg_alt })
      hl(0, "Type",         { fg=p.cyan })
      hl(0, "Operator",     { fg="#67777A" })
    end

    vim.api.nvim_create_user_command("ColorschemeShodan", shodan.setup, {})
    vim.cmd("ColorschemeShodan")
  '';

    colorschemes.kanagawa       = {
      enable    = false;
      settings  = {
        colors  = {
          palette = {
            fujiWhite = "#FFFFFF";
            sumiInko  = "#000000";
          };
          theme = {
            all = {
              ui  = {
                bg_gutter = "none";
              };
            };
            dragon  = {
              syn = {
                parameter = "yellow";
              };
            };
            wave  = {
              ui  = {
                float = {
                  bg  = "none";
                };
              };
            };
          };
        };
        commentStyle  = {
          italic  = true;
        };
        compile         = false;
        dimInactive     = false;
        functionStyle   = { };
        overrides       = "function(colors) return {} end";
        terminalColors  = true;
        theme           = "wave";
        transparent     = false;
        undercurl       = true;
      };
    };
    globals = {
      mapleader       = " ";
      maplocalleader  = " ";
    };
    opts  = {
	  completeopt	=	"menu,menuone,noinsert";
	  pumheight		=	10;
      fileencoding	=	"utf-8";
      number		=	true;
      relativenumber	=	false;

      shiftwidth	=	4;
      expandtab		=	false;
	  tabstop		=	4;
      softtabstop	=	4;
	  tw			=	90;

      breakindent	=	true;
      undofile		=	true;
      signcolumn	=	"yes";
      timeoutlen	=	300;
      splitbelow	=	true;
      splitright	=	true;
      list			=	true;
      listchars		=	{
        tab	=	"▸ ";
        trail	=	"·";
        eol	=	"↵";
        space	=	"·";
      };
      inccommand	=		"split";
      #cursorLine	=	false;
      #scrolloff	=	8;
      clipboard		=	"unnamedplus";

    };
  };
}
