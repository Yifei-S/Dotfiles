{ config
, lib
, pkgs
, ...
}:

{
  imports = [ ./hardware.nix ];

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Tokyo";

  services.openssh.enable = true;

  networking = {
    # head -c4 /dev/urandom | od -A none -t x4
    hostId = "169b9f98";
    hostName = "framework";
    domain = "ysun.co";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  environment.systemPackages = with pkgs; [
    cacert
    sbctl

    coreutils
    inetutils
    dnsutils
    pciutils
    binutils

    direnv
    nix-direnv
    vim
    git
    curl
    wget
  ];

  users.mutableUsers = false;

  services.nixbuild.enable = true;
}
