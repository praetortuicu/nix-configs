{ pkgs, ... }:

{
  home.packages = with pkgs; [

    ### C / C++ ###
    clang-tools        # clangd for LSP + optional compilation

    ### Rust ###
    rust-analyzer      # Rust LSP server

    ### Python ###
    nodejs             # needed for pyright
    pyright  # Python LSP server

    ### Nix ###
    nixd           # Nix LSP server

    ### LaTeX ###
    texlab             # LaTeX LSP server / build integration

    ### Optional: other language tools ###
    lua-language-server  # Lua LSP (optional)
  ];
}
