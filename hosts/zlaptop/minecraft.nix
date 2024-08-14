{ pkgs, lib, ...}:

{
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;

    #package = pkgs.papermc;
    dataDir = "/home/zev/Desktop/minecraft/";

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