# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.luks.devices = [ { device = "/dev/sda2"; name = "rootek"; allowDiscards = true; } ];
  boot.initrd.luks.mitigateDMAAttacks = true;
  #fileSystems."/".device = "/dev/mapper/rootek";

  networking.hostName = "affine"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    wget
		ack
		gnupg
		thunderbird
		silver-searcher
		pinentry
		p7zip
		rlwrap
		sqlite
		time
		tree
		htop
		unrar
		unzip
		watch
		xz
		zip
		bashInteractive
		bashCompletion
		vimHugeX
		aspell
		aspellDicts.en
		aspellDicts.pl
		graphicsmagick
		imagemagick
		git
		gitAndTools.gitFull
		httrack
		rsync
		wget
		openssh
		ffmpeg
		mongodb
		docker
		vlc
		pavucontrol
		pulseaudioFull
		gstreamer
		chromiumBeta
		libpng
		redis
		postgresql94
		nodejs
		npm2nix
		autojump

		python27Full
		python3
		pypy
		ruby_2_2_0
		rubygems
		autoconf
		automake
		doxygen
		diffstat
		patch
		subversion
		clang
		cmake
		llvm
		boost
		libcxx
		gnumake
		rustc
		erlang
		yuicompressor
		kde4.qt4
		gcc
		readline

		linuxPackages.virtualboxGuestAdditions
		linuxPackages.virtualbox

		ghc
		cabal-install

		nox
		clementine
		openconnect
		gnome3.networkmanager_openconnect
		spotify

		python27Packages.docker_compose
		deluge
		thinkfan

		texLiveExtra
		mc
		zsh
		smartmontools
		pypyPackages.youtube-dl

		fbreader
		shotwell
		gnome3.eog
  ];

  

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "pl";
  services.xserver.xkbOptions = "eurosign:e";

  services.postgresql.enable = true;
  services.postgresql.package = pkgs.postgresql94;
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "devicemapper";
  services.mongodb.enable = true;
  services.redis.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.synaptics.enable = true;

  services.thinkfan.enable = true;
  services.thinkfan.sensor = "/sys/devices/virtual/hwmon/hwmon0/temp1_input";

  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.michal = {
    isNormalUser = true;
    createHome = true;
    home = "/home/michal";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxsf" ];
    shell = "/run/current-system/sw/bin/zsh";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

  nixpkgs.config.allowUnfree = true;

  hardware.trackpoint = {
    enable = true;
    sensitivity = 180;
    speed = 140;
    emulateWheel = true;
  };

}
