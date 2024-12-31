{ inputs, lib, ... }:

{ config, pkgs, ... }:

{
  imports = with inputs.self.homeManagerModules.ysun; [ starship ];

  programs.carapace.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;

    plugins = [
      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
        src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
      }
      {
        name = "fast-syntax-highlighting";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
    ];

    shellAliases = lib.mkMerge [
      # bat
      (lib.mkIf config.programs.bat.enable { cat = "bat --plain"; })
      # lsd
      (lib.mkIf config.programs.lsd.enable {
        ls = "lsd";
        tree = "lsd --tree";
      })
      # must use neovim
      {
        emacs = "nvim";
        nano = "nvim";
        vi = "nvim";
        vim = "nvim";
        vimdiff = "nvim -d";
      }
      # tailscale
      (lib.mkIf pkgs.stdenv.isDarwin {
        tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
      })
      # other aliases
      { tf = "terraform"; }
    ];

    # seems broken
    # defaultKeymap = "vicmd";
    initExtra = "bindkey -v";

    profileExtra = lib.optionalString pkgs.stdenv.isDarwin ''
      eval $(${
        if pkgs.stdenv.hostPlatform.isx86_64 then
          "/usr/local/bin"
        else if pkgs.stdenv.hostPlatform.isAarch64 then
          "/opt/homebrew/bin"
        else
          abort "Unsupported OS"
      }/brew shellenv)
    '';
  };
}
