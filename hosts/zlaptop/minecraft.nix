{ pkgs, lib, ...}:

{
  services.minecraft-server = {
    enable = false;
    eula = true;
    declarative = true;

    #package = pkgs.papermc;

    serverProperties = {
      server-port = 25565;
    };

    whitelist = {

    };

  };

  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 80 443 25565 ];
  };
}