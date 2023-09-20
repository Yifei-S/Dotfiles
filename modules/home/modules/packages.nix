{ config, lib, pkgs, ... }: {
  config.home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    age
    agenix
    cacert
    nix
    nix-index
    nixpkgs-fmt
    cachix
    direnv
    nix-direnv
    home-manager
    coreutils
    ghc
    ghcid
    cabal-install
    llvm
    rustup
    go
    python311
    python311Packages.pip
    python311Packages.virtualenv
    ruff
    typst
    texlive.combined.scheme-full
    turbo
    deno
    nodejs
    nodePackages_latest.pnpm
    nodePackages_latest.vercel
    mods
    tmux
    bat
    eza
    btop
    curl
    wget
    ripgrep
    git
    git-lfs
    git-filter-repo
    gitleaks
    gh
    github-copilot-cli
    act
    fq
    jq
    atuin
    gnupg
    hyperfine
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
    google-cloud-sdk
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
    utm
    airbuddy
    bartender
    coconutbattery
    aldente
    raycast
    obsidian
    iina
    discord
    osu-lazer-bin
  ]) ++ (lib.optionals pkgs.stdenv.isLinux [
    mpv
  ]);
}
