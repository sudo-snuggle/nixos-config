{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "🎀";
        height = 12;
        padding = {
          right = 5;
          top = 0;
          bottom = 3;
        };
      };

      display = {
        separator = " : ";
        color = {
          keys = "magenta";
        };
      };

      modules = [
        {
          type = "title";
          format = "{1}@{2}";
          key = " 󱜙 ";
        }
        "break"
        { type = "host"; key = "󰌢 Host"; keyColor = "red"; }
        { type = "display"; key = "󰍹 Display"; keyColor = "green"; }
        "break"
        { type = "os"; key = "󱄅 OS"; keyColor = "red"; }
        { type = "kernel"; key = "󰚚 Kernel"; keyColor = "red"; }
        { type = "packages"; key = "󰏗 Packages"; keyColor = "green"; }
        "break"
        { type = "wm"; key = "󱂬 WM"; keyColor = "yellow"; }
        { type = "terminal"; key = "󰆍 Terminal"; keyColor = "yellow"; }
        "break"
        { type = "cpu"; key = "󰻠 CPU"; keyColor = "blue"; }
        { type = "gpu"; key = "󰢮 GPU"; keyColor = "blue"; }
        { type = "memory"; key = "󰍛 Memory"; keyColor = "magenta"; }
        "break"
        { type = "uptime"; key = "󱎫 Uptime"; keyColor = "red"; }
        "break"
        { type = "colors"; symbol = "circle"; }
      ];
    };
  };
}

