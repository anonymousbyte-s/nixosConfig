{ config, pkgs, ... }:

{
  services.sysc-greet = {
    enable = true;
    compositor = "sway";  # or "cagebreak", "sway", "hyprland" (deprecated)
  };

  services.sysc-greet.settings.default_session = {
    command = "sway";
    user = "tom";
  };

  # Optional: Set initial session for auto-login
  #services.sysc-greet.settings.initial_session = {
  #  command = "sway";
  #  user = "tom";
  #};
}
