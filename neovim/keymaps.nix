{ pkgs, ... }:

{
  programs.nixvim.keymaps = [
    # Diagnostics
    {
      mode = "n";
      key = "]d";
      action.__raw = "function() vim.diagnostic.jump({ count = 1 }) end";
      options = { silent = true; desc = "Next diagnostic"; };
    }
    {
      mode = "n";
      key = "[d";
      action.__raw = "function() vim.diagnostic.jump({ count = -1 }) end";
      options = { silent = true; desc = "Prev diagnostic"; };
    }
    {
      mode = "n";
      key = "]e";
      action.__raw = "function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end";
      options = { silent = true; desc = "Next error"; };
    }
    {
      mode = "n";
      key = "[e";
      action.__raw = "function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end";
      options = { silent = true; desc = "Prev error"; };
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "function() vim.diagnostic.open_float() end";
      options = { silent = true; desc = "Show diagnostic float"; };
    }
    {
      mode = "n";
      key = "<leader>q";
      action.__raw = "function() vim.diagnostic.setloclist() end";
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

