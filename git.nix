{config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    user.name = "praetortuicu";
    user.email = "teodor.ticu@outlook.com";
    settings = {
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
