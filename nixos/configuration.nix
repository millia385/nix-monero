{
  pkgs,
  ssh_public_key,
  ...
}: 
{
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  networking.hostName = "monero-server";

  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = 
  [
    "${ssh_public_key}"
  ];

  environment.systemPackages = with pkgs; [
    curl
    gitMinimal
  ];

  users.users.admin = {
    isNormalUser = true; 
  };

  system.stateVersion = "25.11";
}