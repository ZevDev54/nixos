{lib, config, pkgs, ...}:

let 
  cfg = config.main-user;
in
{
	options.main-user = {
	  enable = lib.mkEnableOption "enable user module";

	  userName = lib.mkOption {
	  	default = "mainuser";
	  	description = ''
	  	Zev
	  	'';
	  };
	};

	config = lib.mkIf cfg.enable {
		users.users.${cfg.userName} = {
			isNormalUser = true;
 			initialPassword = "12345";
			description = "Zev";
			extraGroups = [ "networkmanager" "wheel" ];
			shell = pkgs.zsh;

			packages = with pkgs; [
				vscode
				godot_4
				neofetch
				wget
				htop
				btop
				zsh
			];	
		};	

		programs.zsh = {
		enable = true;
		enableCompletion = true;
 	 	syntaxHighlighting.enable = true;

		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "thefuck" ];
			theme = "robbyrussell";
		};
	};
	};

		

}
