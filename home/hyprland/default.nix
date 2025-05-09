{ pkgs, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		package = pkgs.hyprland;
		xwayland.enable = true;
		systemd.enable = true;

		settings = {
			monitor = [
				"eDP-1,1920x1080@144, auto, 1"
			];

			general = {
				gaps_in = 5;
				gaps_out = 20;

				border_size = 0;
				# "col.active_border" = "rgba(#e6e6e6) rgba(00ff99ee) 45deg";
				# "col.active_border" = "rgba(#e6e6e6)";
				"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.inactive_border" = "rgba(595959aa)";

				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
			};

			decoration = {
				rounding = 10;
				active_opacity = 1;
				inactive_opacity = 1;

				# drop_shadow = true;
				# shadow_range = 4;
				# shadow_render_power = 3;
				# "col.shadow" = "rgba(1a1a1aee)";

				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				}; # blur
			}; #decoration

			animations = {
				bezier = [
					"easeOutQuint,0.23,1,0.32,1"
					"easeInOutCubic,0.65,0.05,0.36,1"
					"linear,0,0,1,1"
					"almostLinear,0.5,0.5,0.75,1.0"
					"quick,0.15,0,0.1,1"
				];

				animation = [
					"global, 1, 10, default"
					"border, 1, 5.39, easeOutQuint"
					"windows, 1, 4.79, easeOutQuint"
					"windowsIn, 1, 4.1, easeOutQuint, popin 87%"
					"windowsOut, 1, 1.49, linear, popin 87%"
					"fadeIn, 1, 1.73, almostLinear"
					"fadeOut, 1, 1.46, almostLinear"
					"fade, 1, 3.03, quick"
					"layers, 1, 3.81, easeOutQuint"
					"layersIn, 1, 4, easeOutQuint, fade"
					"layersOut, 1, 1.5, linear, fade"
					"fadeLayersIn, 1, 1.79, almostLinear"
					"fadeLayersOut, 1, 1.39, almostLinear"
					"workspaces, 1, 1.94, almostLinear, fade"
					"workspacesIn, 1, 1.21, almostLinear, fade"
					"workspacesOut, 1, 1.94, almostLinear, fade"
				];
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			master = {
				new_status = "master";
			};

			device = {
				name = "epic-mouse-v1";
				sensitivity = -0.5;
			};

			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};

			input = {
				kb_layout = "us";
				follow_mouse = 1;

				sensitivity = 0;

				touchpad = {
					natural_scroll = false;
				};
			};

			gestures = {
				workspace_swipe = false;
			};

			#"$terminal" = "kitty -e tmux";
			"$terminal" = "alacritty";

			"$fileManager" = "dolphin";
			"$menu" = "rofi -show drun -show-icons";
			"$browser" = "firefox";
			"$powermenu" = "sh $HOME/.config/rofi/scripts/powermenu_t2";
			"$mainMod" = "SUPER";
                        "$eww" = "~/.local/bin/eww open-many blur_full weather profile quote search_full disturb-icon vpn-icon home_dir screenshot power_full reboot_full lock_full logout_full suspend_full";

			bind = [
				"$mainMod, Q, exec, $terminal"
				"$mainMod, C, killactive,"
				"$mainMod, B, exec, $browser"
				"$mainMod, M, exec, $powermenu"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, V, togglefloating,"
				"$mainMod, R, exec, $menu"
    				"$mainMod, D, exec, $eww"
				"$mainMod, P, pseudo, # dwindle"
				"$mainMod, J, togglesplit, # dwindle"

				"$mainMod SHIFT, M, exec, $wallpaper1"
				"$mainMod SHIFT, N, exec, $wallpaper2"

				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"

				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"

				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"

				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"

				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"

				"$mainMod, PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
				", PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"
				"$shiftMod, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"

				"$mainMod, f, exec, bash -c \"grim -l 0 -g \\\"$(slurp)\\\" - | wl-copy\""
				", Print, exec, bash -c \"grim -l 0 -g \\\"$(slurp)\\\"\""

			];

			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];

			bindel = [
				",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
				",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
			];

			bindl = [
				",XF86AudioNext, exec, playerctl next"
				",XF86AudioPause, exec, playerctl play-pause"
				",XF86AudioPlay, exec, playerctl play-pause"
				",XF86AudioPrev, exec, playerctl previous"
			];

			"windowrulev2" = "suppressevent maximize, class:.*";

		}; #settings

		extraConfig = ''
			exec = wl-gammactl -c 0.935 -b 0.998 -g 0.806
			exec-once=zsh ~/nix/script/start.sh
			windowrule = workspace 1, $terminal
			windowrule = workspace 2, firefox
			windowrule = workspace 4, discord
			windowrule = workspace 5, spotify
		'';

	}; # wayland.windowManager.hyprland
}
