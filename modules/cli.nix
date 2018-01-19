{ pkgs, ... }:
let
  overlay = import ../overlays;
in
{
  time.timeZone = "Europe/Berlin";
  
  environment.shellAliases = {
    "cd-tmp" = "cd $(${pkgs.coreutils}/bin/mktemp -d)";
    "cd1" = "cd ..";
    "cd2" = "cd ../..";
    "cd3" = "cd ../../..";
    "cd-" = "cd -";
  };

  users.extraUsers.root.initialPassword = "guest";

  users.extraUsers.mbock = {
    initialPassword = "guest";
    isNormalUser = true;
    uid = 1001;
    extraGroups = [
      "wheel"
      "networkmanager"
      "scanner"
      "audio"
    ];
    openssh.authorizedKeys.keys = with import ../keys.nix; [ one ];
  };

  environment.systemPackages = with pkgs; [ emacs git pstree which coreutils ];

  networking.extraHosts = ''
    46.38.233.235 netcup
  '';

  nixpkgs.overlays = [ overlay ];

  #system.autoUpgrade.channel = https://nixos.org/channels/nixos-17.09;
  #system.autoUpgrade.enable = true;
}
