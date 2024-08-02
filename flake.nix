{
  description = "My nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
