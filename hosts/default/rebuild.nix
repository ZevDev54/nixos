{pkgs }:

pkgs.writeShellScriptBin "rebuild" ''
	set -e

	pushd ~/dotfiles/nixos/

	if git diff --quiet '*.nix'; then
		echo "No changes detected, exiting."
		popd
		exit 0
  fi

	#git diff -U0 '*.nix'
	echo "NixOS rebuilding..."

	sudo nixos-rebuild switch --flake ~/dotfiles/nixos/flake.nix#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

	current = $(nixos-rebuild list-generations | grep current)

	git commit -am "$current"

	popd

	notify-send -e "NixOS rebuilt OK!"
	
''
