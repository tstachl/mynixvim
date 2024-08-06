{
  description = "My nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/24.05";
    # nixvim.url = "github:nix-community/nixvim/main";
    # nixvim.url = "github:tstachl/nixvim/plugins/lsp/nextls";
    nixvim.url = "git+file:///Users/thomas/workspace/tstachl/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];


      # perSystem = { system, ... }: {
      #   _module.args.pkgs = import inputs.nixpkgs {
      #     inherit system;
      #     overlays = [
      #       inputs.foo.overlays.default
      #       (final: prev: {
      #         # ... things you need to patch ...
      #       })
      #     ];
      #     config = { };
      #   };
      # };

      perSystem =
        { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = { inherit pkgs; };
          };
          nvim   = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              (final: prev: {
                stable = import inputs.nixpkgs-stable {
                  system = final.system;
                };
              })
            ];
          };

          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            default   = nvim;
            editor    = nvim.extend { imports = [ ./config/editor.nix ]; };
            obsidian  = nvim.extend { imports = [ ./config/obsidian.nix ]; };
          };
        };
    };
}
