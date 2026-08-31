{ config, pkgs, lib, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  environment.systemPackages = with pkgs; [
    waybar # top bar for wayland
    swayidle # idle managment daemon
    swaylock-effects # display locker
    swaybg # wallpaper manager
    wl-clipboard # copy paste
    grim # screen shot manager
    slurp # partial screen shot manager
    impala # WiFi TUI
    bluetui # bluetooth TUI
    fuzzel # fuzzy search
  ];

  # file manager
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };

  /*services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };*/

}
