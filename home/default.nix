{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./nixvim
    ./waybar
		./zsh
		./kitty
		./alacritty
		# ./starship/default.nix
		./dunst
		#./firefox
		#./rofi
  ];

  home = {
    username = "yazid";
    homeDirectory = "/home/yazid";

    # rofi configuration
    file = {
	".config/rofi".source = ./rofi;
        ".local/share/rofi/themes".source = ./local/share/rofi/themes;
     };
     
		stateVersion = "24.05";
		packages = with pkgs; [
			# java
			# wl-gammactl
			# devenv
			# jdk21_headless
			# netbeans
			zsh
			# stylix
			# dolphin
			# ciscoPacketTracer8

			# python
			# python313Packages.mypy
			#   python313Packages.jupyter
			# python313
			# python313Packages.pip
			# python313Packages.ipykernel

			# python311
			obsidian
			# unrar
			# wireshark
			# gnumake42
			postman
			# planify
			# ida-free
			# burpsuite

			# lsp
			vscode-langservers-extracted
			nodejs_22
			prettierd
			zoom-us

			lsof
			air
			glibc
			# protobuf
			# protoc-gen-go
			# gofumpt                # Go formatter
			# goimports-reviser       # Go imports reviser
			# golines                 # Go line formatter
			# mdformat                # Markdown formatter
			# nixpkgs-fmt             # Nix formatter
			# prettierd               # Prettier daemon for formatting
			# jetbrains.phpstorm
			# wf-recorder
			# go
			# spotify

			intelephense
			# php82Packages.php-cs-fixer
			# blade-formatter
			unzip
			vscode
			vlc
			# discord

			obs-studio
			oh-my-zsh
			tmux
			fzf

      # virtualisation
      # distrobox
      # clip

      # i fw w these
      kitty
      kitty-themes
      alacritty
      pfetch
      firefox
      # brave

      # wayland tools
      waybar
      waypaper
      waybar
      dunst 
      # swww
      rofi-wayland
      

      # additional utils
      atool
      httpie
      tmux
      starship

      # c/c++
      gcc
      cmake
      pkg-config
      dust
      dolphin
      # kdePackages.dolphin
      dolphin
      hyprshot
      tree

			# discord
			# php
    ];
		
		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
  };


  services.hyprpaper = {
	enable = true;
	settings = {
		preload = [
		   "~/Pictures/wallpaper/nixos-wallpaper-catppuccin-mocha.png"
		];
		wallpaper = [
		    " ,~/Pictures/wallpaper/nixos-wallpaper-catppuccin-mocha.png"
		];
	};
  };

  programs = {
    home-manager.enable = true;
    
    git = {
      enable = true;
      userName = "Y4zidd";
      userEmail = "dahlahg7@gmail.com";
      # init.defaultBranch = "main";
    };

    starship = {
  	enable = true;
  	settings = {
    	add_newline = true;
    	command_timeout = 1300;
    	scan_timeout = 50;
    	format = "[$username]($style)$directory\n$os$character";
    	character = {
      		success_symbol = "[ ➜ ](bold green)";
      		error_symbol = "[ ✗ ](bold red)";
    	};
      os = {
      disabled = false;  # Pastikan di-enable
      format = "[$symbol]($style)";
      style = "bold white";
      symbols = {
        NixOS = "❄️ ";    # Logo NixOS
        Arch = "🐧 ";     # Logo Arch
        Ubuntu = " ";    # Logo Ubuntu (Nerd Font)
        Windows = " ";   # Logo Windows
      };
    };
    username = {
     	disabled = false;
	show_always = true;
	style_user = "bold blue";
	format = "[$user ]($style)";
    };
   };
};

    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        nixrbs = "sudo nixos-rebuild switch --flake ~/system#dosed";
        nixrbt = "sudo nixos-rebuild test --flake ~/system#dosed";
        nixrbb = "sudo nixos-rebuild boot --flake ~/system#dosed";
       }; #shellAliases
    }; # bash
  };  # programs
}
