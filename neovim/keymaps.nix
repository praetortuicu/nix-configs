{ pkgs, ... }:

{
  programs.nixvim.keymaps = [
    # Diagnostics
    {
      mode = "n";
      key = "]d";
      action.__raw = "vim.diagnostic.goto_next";
      options = { silent = true; desc = "Next diagnostic"; };
    }
    {
      mode = "n";
      key = "[d";
      action.__raw = "vim.diagnostic.goto_prev";
      options = { silent = true; desc = "Prev diagnostic"; };
    }
    {
      mode = "n";
      key = "]e";
      action.__raw = "function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end";
      options = { silent = true; desc = "Next error"; };
    }
    {
      mode = "n";
      key = "[e";
      action.__raw = "function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end";
      options = { silent = true; desc = "Prev error"; };
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "vim.diagnostic.open_float";
      options = { silent = true; desc = "Show diagnostic float"; };
    }
    {
      mode = "n";
      key = "<leader>q";
      action.__raw = "vim.diagnostic.setloclist";
      options = { silent = true; desc = "Diagnostic list"; };
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
      action = "luasnip#choice_active() ? '<Plug>luasnip-next-choice' : ''";
      options = {
        silent = true;
        expr = true;
      };
    }
  ];
}

