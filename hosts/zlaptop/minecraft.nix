{ pkgs, lib, ...}:

{
  services.minecraft-server = {
    enable = true;
    eula = true;

    package = pkgs.papermc;
    dataDir = "/home/zev/Desktop/Minecraft/";

  };
}