{config, pkgs, ...}:

{
  networking.openconnect.interfaces."uni-heidelberg" = {
    autoStart = false;
    gateway = "vpnsrv0.urz.uni-heidelberg.de";
    protocol = "anyconnect";
    user = "cz281";
    passwordFile = config.sops.secrets."openconnect/password".path;
    extraOptions = {
      useragent = "AnyConnect";
      no-external-auth = true;
    };
  };
}
