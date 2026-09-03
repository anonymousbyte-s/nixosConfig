{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # file manager
  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };
}
