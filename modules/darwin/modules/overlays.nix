{ inputs, ... }@context:
{ config, lib, pkgs, ... }: {
  config.nixpkgs.overlays = [
    (self: super: {
      osu-lazer-bin = inputs.osu-overlay.packages.${super.system}.osu-lazer-bin;
      vscode = inputs.vscode-overlay.packages.${super.system}.vscodeInsiders;
      raycast = inputs.raycast-overlay.packages.${super.system}.raycast;
    })
  ];
}
