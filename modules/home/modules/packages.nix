{ config, lib, pkgs, ... }: {
  config.home.packages = with pkgs.nodePackages_latest;  with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    cacert
    nix
    nix-index
    nixpkgs-fmt
    cachix
    comma
    direnv
    nix-direnv
    home-manager
    coreutils
    llvm
    rustup
    go
    typst
    texlive.combined.scheme-full
    nodejs
    pnpm
    vercel
    github-copilot-cli
    mods
    tmux
    bat
    exa
    btop
    curl
    wget
    ripgrep
    git
    gh
    fq
    jq
    atuin
    gnupg
    neovim
    lazygit
    fzf
    fd
    tree-sitter
    entr
    code-minimap
    qemu
    docker
    terraform
    awscli2
    flyctl
    ffmpeg
    yt-dlp
    zathura
    vscode
    zoom-us
  ] ++ (lib.optionals pkgs.stdenv.isDarwin [
    smimesign
    cocoapods
    lima
    colima
    iterm2
    raycast
    iina
    discord
    osu-lazer-bin
  ]) ++ (lib.optionals pkgs.stdenv.isLinux [
    mpv
  ]);
}
