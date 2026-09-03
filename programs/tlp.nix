{
  # Not used in sway, but is sometimes included with other
  # WMs and DEs, so it's best to disable it to prevent conflicts
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    # Enable the power-profiles-daemon D-Bus interface for TLP
    pd.enable = true;

    settings = {
      # 0: manual switching only
      # 1: auto switches no matter what
      # 2: like mode 1, but stops auto switching if a manual switch happend
      TLP_AUTO_SWITCH = 1;

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_SAV = "power";

      # Optional helps save long term battery health
      #START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      #STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };
}
