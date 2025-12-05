{ pkgs, ... }:

{
  programs.nixvim.keymaps = [
    # Insert mode completion
    {
      mode = [ "i" ];
      key = "<c-b>";
      action = "<cmd>lua require('luasnip').jump(-1)<Cr>";
      options.silent = true;
    }

    # LuaSnip snippet navigation
    {
      mode = [ "i" ];
      key = "<C-j>";
      action = "<cmd>lua require('luasnip').jump(1)<Cr>";
      options.silent = true;
    }
    {
      mode = [ "i" ];
      key = "<C-k>";
      action = "<cmd>lua require('luasnip').jump(-1)<Cr>";
      options.silent = true;
    }
    {
      mode = [ "i" ];
      key = "<C-l>";
      action = "luasnip#choice_active() ? '<Plug>luasnip-next-choice'";
      options.silent = true;
    }
  ];
}

