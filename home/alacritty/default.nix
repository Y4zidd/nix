{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "alacritty";
      
      font = {
        size = 13;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };

      # keyboard.bindings = [
      #  {
      #    action = "CreateNewWindow";
      #    key = "N";
      #    mods = ["Control" "Shift"];
      #  }
      #];

      window = {
        dynamic_padding = true;
        dynamic_title = true;
        opacity = 0.9;
        padding = {
          x = 0;
          y = 0;
        };
        dimensions = {
          columns = 80;
          lines = 30;
        };
      };

      selection.save_to_clipboard = true;

      colors = {
        primary = {
          background = "#11111B";
          foreground = "#cdd6f4";
          dim_foreground = "#7f849c";
          bright_foreground = "#11111B";
        };
        cursor = {
          text = "#1e1e2e";
          cursor = "#f5e0dc";
        };
        vi_mode_cursor = {
          text = "#1e1e2e";
          cursor = "#b4befe";
        };
        search = {
          matches = {
            foreground = "#1e1e2e";
            background = "#11111B";
          };
          focused_match = {
            foreground = "#1e1e2e";
            background = "#11111B";
          };
        };
        # You can add more color definitions here as needed
      };
    };
  };
}
