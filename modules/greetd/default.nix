# nixpkgs options

{ config
, lib
, pkgs
, ...
}:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      vt = "next";
      user = "greeter";
      command = lib.strings.concatStringsSep " " [
        "${pkgs.greetd.tuigreet}/bin/tuigreet"
        "--time"
        "--remember"
        "--user-menu"
        "--asterisks"
        "--power-no-setsid"
        "--power-shutdown shutdown now"
        "--power-reboot reboot"
        "--cmd ${config.programs.hyprland.package}/bin/Hyprland"
      ];
    };
  };
}
