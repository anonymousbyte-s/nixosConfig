{ config, pkgs, ... }:

{
  services.sysc-greet = {
    enable = true;
    compositor = "sway"; # or "cagebreak", "sway", "hyprland" (deprecated)
  };

  services.sysc-greet.settings.default_session = {
    command = "sway";
    user = "tom";
  };
}
