{pkgs }:

pkgs.writers.writeBashBin "rebuild" ''
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

	

	git commit -am "$(nixos-rebuild list-generations | grep "current")"

	popd

	echo "NixOS built and successfully comitted!"
	
''
