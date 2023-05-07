{
  description = "@StepBroBD: Yet another dotfiles repo with Nix";

  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";

    utils.url = "flake:flake-utils";

    darwin = {
      url = "flake:nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "flake:home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-overlay = {
      url = "github:stepbrobd/vscode-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    raycast-overlay = {
      url = "github:stepbrobd/raycast-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      context = {
        inherit inputs;
      };
    in
    {
      homeConfigurations = {
        StepBroBD = import ./modules/home/StepBroBD.nix context;
      };
      darwinConfigurations = {
        aarch64-darwin = import ./modules/darwin/aarch64-darwin.nix context;
        x86_64-darwin = import ./modules/darwin/x86_64-darwin.nix context;
      };
      nixosConfigurations = {
        aarch64-linux = import ./modules/nixos/aarch64-linux.nix context;
        x86_64-linux = import ./modules/nixos/x86_64-linux.nix context;
      };

      # FIX: shouldn't be here, import directory in darwinConfigurations
      darwinModules = {
        default = import ./modules/darwin/modules/default.nix context;
        overlay = import ./modules/darwin/modules/overlay.nix context;
      };
      # FIX: shouldn't be here, import directory in homeConfigurations
      homeModules = {
        default = import ./modules/home/modules/default.nix context;
        pkgs = import ./modules/home/modules/pkgs.nix context;
        activation = import ./modules/home/modules/activation.nix context;
      };
    };
}
