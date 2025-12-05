{config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "praetortuicu";
    userEmail = "teodor.ticu@outlook.com";
    extraConfig = {
      core.editor = "vim";
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort  = "version:refname";
      diff  = {
        algorithm = "histogram";
        colorMoved  = "plain";
        mnemonicPrefix  = true;
        renames = true;
      };
    };
  };
}
