# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/suspend-and-hibernate.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # enable grub
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  nix.settings.experimental-features = [ "nix-command flakes" ];
  # boot.kernelParams = [ "acpi_backlight=video"];

  networking = {
		hostName = "nixos"; # Define your hostname.
		networkmanager.enable = true;
		# wireless.networks."ASRAMA-NET".psk = "Asr4m@ku";
		# networkmanager.unmanaged = [ "wlan0" ];
	};

	systemd.services.NetworkManager-wait-online.enable = false;
	systemd.network.wait-online.enable = false;
	boot.initrd.systemd.network.wait-online.enable = false;

	networking.nameservers = [ "1.1.1.1"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # zsh active
  # system.userActivationScripts.zshrc = "touch .zshrc";
  # users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yazid = {
    isNormalUser = true;
    description = "Yazid";
    extraGroups = [ "networkmanager" "wheel" "audio" "video"];
    # packages = with pkgs; [
    # kdePackages.kate
    #  thunderbird
    # ];
  };

  # hyprland active
  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "yazid";

  # programs.dolphin.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # add fonts
  fonts.packages = with pkgs; [ nerdfonts ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # acpilight
  hardware.acpilight.enable = true;
  programs.light.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
        	fd
		docker-compose
		pavucontrol
		nbfc-linux
		mangohud
		blueman
		bluez
		gcc
		glibc
		# core
		p7zip
		bash
		git
		neovim

		j4-dmenu-desktop
		bemenu
		joplin-desktop

		# wayland utils
		grim
		slurp
		wl-clipboard
		libnotify

		# sys utils
		lshw
		geeqie

		# network tools
		networkmanager

		brightnessctl
		ddcutil

		xorg.xbacklight

		# hyprland env
		dunst
		alacritty
		cava
		hypr
		rofi
		waybar
		waypaper
                xwayland
		hyprpaper

		# tooltambahan
		alacritty
		dunst
  ];

  # desktop portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

  hardware.graphics = {
		enable = true;
	};

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  hardware.nvidia.prime = {
		# default is sync. use on-the-go if u were to go outside
		sync.enable = true;

		intelBusId = "PCI:02:00:0";
		nvidiaBusId = "PCI:01:00:0";
  };

  	specialisation = {
		nongkrong.configuration = {
			system.nixos.tags = [ "nongkrong" ];
			hardware.nvidia = {
				prime.offload.enable = lib.mkForce true;
				prime.offload.enableOffloadCmd = lib.mkForce true;
				prime.sync.enable = lib.mkForce false;
			};
		};
	};


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  
  #services.hyprpaper = {
  #      enable = true;
  #      settings = {
  #              preload = [
  #                 "~/Pictures/wallpaper/nixos-wallpaper-catppuccin-mocha.png"
  #              ];
  #              wallpaper = [
  #                  "eDP-1,~/Pictures/wallpaper/nixos-wallpaper-catppuccin-mocha.png"
  #              ];
  #       };
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
