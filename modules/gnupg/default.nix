# nixpkgs options

{ config
, lib
, pkgs
, ...
}:

{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
