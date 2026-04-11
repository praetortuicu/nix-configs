{ pkgs, ... }:

{
    programs.vim = {
      enable = true;

    plugins = with pkgs.vimPlugins; [
      ale
      vim-airline
      nerdtree
#      python-mode
      vim-nix
      vim-polyglot
      vim-surround
      vimtex
      vim-fugitive
    ];

      extraConfig = ''
        syntax on
        set number
        set shiftwidth=4
        set tabstop=4
        set colorcolumn=100
        set textwidth=100
        set wrapmargin=0
        set formatoptions+=t
        set linebreak
        set clipboard=unnamed

        if executable("wl-copy") && executable("wl-paste")
        set clipboard=unnamedplus

  " Override Vim's clipboard interface
          let g:clipboard = {
                \   'name': 'wl-clipboard',
                \   'copy': {
                \      '+': 'wl-copy --foreground --type text/plain',
                \      '*': 'wl-copy --foreground --type text/plain',
                \    },
                \   'paste': {
                \      '+': 'wl-paste --no-newline',
                \      '*': 'wl-paste --no-newline',
                \   },
                \   'cache_enabled': 1,
                \ }
        endif
      '';
    };
}
