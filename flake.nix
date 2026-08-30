{
  description = "A very basic flake";

  inputs = {
    # define which url to use for the packages version
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    sysc-greet = {
      url = "github:Nomadcxx/sysc-greet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, sysc-greet, ... }: {
    nixosConfigurations.macbookAir7-2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/macbookAir7-2/configuration.nix
        sysc-greet.nixosModules.default
      ];
    };
  };
}
