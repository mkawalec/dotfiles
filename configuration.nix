# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

env@{ config, pkgs, ... }:

#let haskellPackages = pkgs.haskell.packages.ghc843;
#    time = haskellPackages.callHackage "time" "1.6.0.1" {};
#
#    hp = haskellPackages.override {
#      overrides = self: super: {
#        time = time;
#        unix = haskellPackages.callHackage "unix" "2.7.2.0" {};
#        threads = haskellPackages.callHackage "threads" "0.5.1.6" {};
#        "timezone-olson" = haskellPackages.callHackage "timezone-olson" "0.1.9" {};
#      };
#    };
let    bridge = pkgs.libsForQt5.callPackage /home/michal/build/nixpkgs/pkgs/applications/networking/protonmail-bridge { };
in

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
  boot.initrd.luks.mitigateDMAAttacks = true;
  #fileSystems."/".device = "/dev/mapper/rootek";

  networking.hostName = "affine"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
  #networking.wicd.enable = true;

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
		gstreamer
		chromium
    google-chrome
		libpng
		redis
		postgresql94
    nodejs-9_x
    pkgconfig
		npm2nix
		autojump
    slack
    signal-desktop
    smplayer
    mplayer

		python27Full
    pypi2nix
		python3
		pypy
		autoconf
		automake
		doxygen
		diffstat
		patch
		subversion
		cmake
		llvm
		boost
		libcxx
		gnumake
		rustc
		erlang
		yuicompressor
		gcc
		readline

		linuxPackages.virtualboxGuestAdditions
		linuxPackages.virtualbox

		nox
		clementine
		openconnect
		gnome3.networkmanager_openconnect
		networkmanagerapplet
		spotify
    feh

		python27Packages.docker_compose
		deluge
		thinkfan

		mc
		fish
		smartmontools
		pypyPackages.youtube-dl
    powertop

		fbreader
		shotwell
		#gnome3.eog
    steam
    wine
    winetricks
    playonlinux
    xorg.xmodmap
    gnome3.nautilus
    gnome3.evolution
    gnome3.gnome-screenshot
    gnome3.adwaita-icon-theme
    gnome3.gnome-keyring
    gnome3.simple-scan
    libsecret
    clementine
    xcompmgr
    xfce.terminal
    enpass
    psmisc

    stalonetray
	 	xscreensaver
    #hp.hackage-server
    stack
    dmenu
		ghc
		cabal-install
    binutils-unwrapped
    zlib
    blueman
    konsole
    meson
    ninja
    bridge
    system-config-printer
    fuse_exfat
    baobab
    kmail
    kdeApplications.kmail-account-wizard
    firefox
    
    nodePackages.node2nix

    androidenv.platformTools
    android-studio
  
    kismet
    bluez5_28
    bluez-tools
    wireshark-gtk
    thc-hydra

    gnome3.networkmanager_openvpn
    openvpn
    nodePackages.node2nix
  ] ++ (with haskellPackages; [
    xmobar
    hlint
    happy
    threadscope
    cabal2nix
  ]);

  programs.light.enable = true;

  fonts.fonts = with pkgs; [
    corefonts
    fira-code
    hasklig
    inconsolata
    iosevka
    source-code-pro
    unifont
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
	];
  fonts.enableFontDir = true;
  fonts.fontconfig.defaultFonts.monospace = [ "Inconsolata" ];
  

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.tlp.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  programs.adb.enable = true;

  hardware.bluetooth.enable = true;
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  #services.postgresql.enable = true;
  #services.postgresql.package = pkgs.postgresql94;
  virtualisation.docker.enable = true;
  #virtualisation.docker.storageDriver = "devicemapper";
  #services.mongodb.enable = true;
  #services.redis.enable = true;
  services.deluge.enable = true;


  # Enable the X11 windowing system.
  services.xserver = {
    videoDrivers = [ "intel" ];
    #deviceSection = ''
    #    Option "DRI" "2"
    #  '';
    useGlamor = true;
    enable = true;
    layout = "pl";
    xkbOptions = "eurosign:e";
    libinput.enable = true;

    displayManager.gdm.enable = true;

    windowManager.default = "xmonad";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    desktopManager.gnome3.enable = true;
  };
  services.compton = {
    enable = true;
    #vSync = "opengl-oml";
  };

    
  powerManagement.enable = true;

  #services.thinkfan.enable = true;
  #services.thinkfan.sensor = "/sys/devices/virtual/hwmon/hwmon0/temp1_input";

  #programs.zsh.enable = true;
  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.michal = {
    isNormalUser = true;
    createHome = true;
    home = "/home/michal";
    extraGroups = [ "wheel" "networkmanager" "docker" "vboxsf" "adbusers" ];
    shell = "/run/current-system/sw/bin/fish";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "18.03"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;

  hardware.trackpoint = {
    enable = true;
    sensitivity = 180;
    speed = 140;
    emulateWheel = true;
  };

}
