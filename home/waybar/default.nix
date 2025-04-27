{
  programs.waybar = {
    	enable = true;
    	systemd.enable = true;
    	style = ''* {
  	border: none;
  	font-family: 'Fira Code', 'Symbols Nerd Font Mono', 'JetBrainsMono NF';
  	font-size: 16px;
  	font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
  	min-height: 45px;
	}

	window#waybar {
  	background: transparent;
	}

	#custom-nixos, #workspaces {
  	border-radius: 10px;
  	background-color: #11111b;
  	color: #b4befe;
  	margin-top: 15px;
  	margin-right: 15px;
  	padding-top: 1px;
  	padding-left: 8px;
  	padding-right: 8px;
	}

	#custom-nixos {
  	font-size: 20px;
  	margin-left: 20px;
  	color: #b4befe;
	}

	#workspaces button {
  	background: #11111b;
  	color: #b4befe;
	}

	#clock, #backlight, #pulseaudio, #network, #battery, #tray{
  	border-radius: 10px;
  	background-color: #11111b;
  	color: #cdd6f4;
  	margin-top: 15px;
  	padding-left: 10px;
  	padding-right: 10px;
  	margin-right: 15px;
	}


	#pulseaudio, #backlight, #network {
  	border-top-left-radius: 10;
  	border-bottom-left-radius: 10;
  	padding-left: 10px;
  	padding-right: 10px;
  	margin-top: 15px;
	}


	#clock {
  	margin-right: 0;
	}

	'';
	settings = [{
		height = 33;
		spacing = 9;
		tray = {
			spacing = 10;
		};
		modules-left = [ "custom/nixos" "hyprland/workspaces" ];
		modules-center = [ "clock" ];
		modules-right = [ "backlight" "pulseaudio" "network" "battery" ];
		battery = {
				format = "<span color='#b4befe'>{icon}</span> {capacity}%";
				format-charging = "<span color='#b4befe'></span> {capacity}%";
				format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
				format-plugged = "{capacity}% ";
                                tooltip = false;
				states = {
					critical = 15;
					warning = 30;
				};
			};
		network = {
				interval = 1;
				format-alt = "{ifname}: {ipaddr}/{cidr}";
				format-disconnected = "<span color='#b4befe'>󰖪 </span>No Network";
				format-ethernet = "{ipaddr}/{cidr} 󰈀";
				#format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
				#format-linked = "{ifname} (No IP) ";
				format-wifi = "<span color='#b4befe'>  </span>{essid}";
				#format-wifi = "{essid} ({signalStrength}%) ";
			};
		pulseaudio = {
				format = "<span color='#b4befe'>{icon}</span> {volume}%";
				format-bluetooth = "{volume}% {icon}";
				format-bluetooth-muted = " {icon}";
				format-icons = {
					car = "";
					default = [ "" "" "󰕾" "󰕾" "󰕾" "" "" "" ];
					handsfree = "";
					headphone = "";
					headset = "";
					phone = "";
					portable = "";
				};
				format-muted = " {format_source}";
				format-source = "";
				format-source-muted = "";
				# on-click = "pavucontrol";
				tooltip = false;
			};
		backlight = {
			device = "intel_backlight";
			format = "<span color='#b4befe'>{icon}</span> {percent}%";
			format-icons = ["" "" "" "" "" "" "" "" ""];		
		};
		clock = {
			format = "<span color='#b4befe'> </span>{:%H:%M}";
		};
		"hyprland/workspaces"  = {
			format = "{icon}";
			tooltip = true;
			all-outputs = true;
			format-icons = {
				active = "";
				default = "";
			};
		};
		"custom/nixos" = {
			format = "  ";
			tooltip = false;
			on-click = "rofi -show drun -show-icons"; 
		};
	}];

    };
}
