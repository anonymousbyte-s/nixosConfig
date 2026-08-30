{ pkgs, inputs, lib, ... }: 

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --cmd sway";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = lib.mkForce "simple"; # force the service type to simple to avoid waiting for other services to start
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  environment.etc."tuigreet/config.toml".text = ''
    [display]
    show_time = true
    greeting = "Welcome home, sir"
    align_greeting = "center"
    issue = false

    [layout]
    width = 60
    window_padding = 2
    container_padding = 1
    prompt_padding = 1

    [layout.widgets]
    time_position = "top"
    status_position = "bottom"

    [remember]
    username = true
    session = false
    user_session = true

    [user_menu]
    enabled = true
    min_uid = 1000
    max_uid = 60000

    [secret]
    mode = "hidden"
    # characters = "*"

    [keybindings]
    command = 2
    sessions = 3
    background = 4
    power = 12

    [background]
    kind = "none"
    fps = 30

    [power]
    use_setsid = false

    [theme]
    border = "white"
    text = "white"
    time = "blue"
    container = "black"
    title = "lightCyan"
    greet = "blue"
    prompt = "lightCyan"
    input = "white"
    action = "blue"
    button = "white"
  '';
}
