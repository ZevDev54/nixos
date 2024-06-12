{pkgs }:

pkgs.writeShellScriptBin "rebuild" ''
	sudo nixos-rebuild switch --flake ~/dotfiles/nixos/flake.nix#default
''
