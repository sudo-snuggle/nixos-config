{ config, pkgs, ... }:

{


# ----- [ IMPORTS ] ------------------------------

  imports =
    [ # results of the hardware scan.
      ./hardware-configuration.nix


      ./modules/fonts/fonts.nix
      ./modules/power/undervolt.nix
      ./modules/power/thinkfan.nix
    ];

# ----- [ BOOTLOADER ] ------------------------------

# Disable systemd-boot
  boot.loader.systemd-boot.enable = false;

  # Enable GRUB
  boot.loader.grub = {
    enable = true;
    device = "nodev"; 
    efiSupport = true;
    # search for others
    useOSProber = true; 
  };
  
  # EFI variables can still be touched
  boot.loader.efi.canTouchEfiVariables = true;




# ----- [ KERNEL and FIRMWARE ] ------------------------------

  # This sets the kernel to 6.12,
  # or latest

  boot.kernelPackages = pkgs.linuxPackages_6_12;
  #boot.kernelPackages = pkgs.linuxPackages_latest;  # latest

  # tell computer to install firmware.
  hardware.firmware = [ pkgs.linux-firmware ];

# ----- [ HOSTNAME ] --------------------------------------------

  # Set up hostname
  networking.hostName = "Nixos";

# ----- [ NETWORKING AND WIFI ] ---------------------------------

  # Set up network manager
  networking.networkmanager.enable = true;

# ----- [ TIME AND INTERNATIONALIZATION ] ------------------------------

  # "Timezone,
  time.timeZone = "Asia/Colombo";

  # "internationalization stuff
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


# ----- [ DISPLAY MANAGER ] ------------------------------

  # login screen
  # services.displayManager.sddm.enable = true;
  # services.displayManager.gdm.enable = true;
  services.displayManager.ly.enable = true;

# ----- [ DESKTOP ] --------------------------------------

    programs.niri.enable = true;
  #  services.desktopManager.plasma6.enable = true;
  # services.desktopManager.gnome.enable = true;
  # services.xserver.desktopManager.lxqt.enable = true;


# ----- [ XDG PORTALS ] ------------------------------

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "*"; # Helps portals decide which one to use
    };

# ----- [ SUID WRAPPERS ] ------------------------------

  # "Some programs need SUID wrappers, can be configured
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

# ----- [ USER ACCOUNTS ] ------------------------------

  #  basic user accounts
  # use the command "sudo passwd username" with the username of the account you need to set a password for as username"
  users.users.yasiru = {
    shell = pkgs.fish; # We use fish here, due to us having taste
    isNormalUser = true;
    description = "admin user...";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
       gparted
       # add apps for this user only!!!
    ];
  };
  users.users.guest = {
    shell = pkgs.bash; # Guests only get BASH!!! Ha, they live without high end tools.
    isNormalUser = true;
    description = "guest usewr";
    extraGroups = [  ]; # No sudo for you.
    packages = with pkgs; [
    ];
  };


# ----- [ Installed Packages ] ------------------------------

  environment.systemPackages = with pkgs; [

 # niri tools
    fuzzel
    swaylock
   # waybar
    mako

  # "Terminal Emulators"
    alacritty
    #foot
    kitty

  # "File Managers & Text Editors 
  #kdePackages.dolphin
  #kdePackages.kate
  #nano
  neovim
  #ranger
  #vim
  thunar
  thunar-archive-plugin
  vscodium
  # geany-plugins

  # " yazi"
  yazi
  ffmpegthumbnailer
  imagemagick
  poppler-utils



  # "System Info & Eye Candy"
  asciiquarium
  btop
  bottom
  cmatrix
  fastfetch 
  htop
  lolcat
  procs

  # "Web & Media"
 # brave
  #chromium #  GOOGLE SPYWARE.
  #firefox
  localsend
 # mpv
  # vlc
 # yt-dlp # download youtube videos. 
  # youtube-music
  # tor
  # zoom-us
 # ytfzf #yt search in terminal

  # Productivity & Office
  #anki
  #calibre
  #libreoffice-qt-fresh
  #obsidian
  #spotify
  #thunderbird
  #zathura

  # Core CLI Utilities
  curl
  git
 # gnupg
  #less
  #unzip
  wget

  # Modern CLI Replacements
  bat           # cat with syntax highlighting
  delta         # git diff highlighter
  eza           # modern ls
  fd            # simple fast find
  fzf           # fuzzy finder
  ripgrep       # recursive grep
  zoxide        # smarter cd

  # Development and Container Tools
  #direnv
  #docker
  #lazydocker    # TUI for Docker/Podman
  #nixpkgs-fmt
  #podman        # Docker alternative (rootless by default)
  #vscode

  # Gaming
  #gamemode
  #godot
 # lutris
  #mangohud
  #protonup-qt
  #steam          # This is in enabled allready, just here to remind 
  #steam-run
  #superTuxKart

  # "Creative & Multimedia"
 # audacity
  #blender
  #gimp
  #handbrake
  #inkscape
 # krita
  #obs-studio

  # "System Maintenance & Hardware"
   pciutils       # lspci
   #pavucontrol
   smartmontools
   # usbutils       # lsusb
   lm_sensors      # CLI tool for checking sensors
   powertop

  # "Security & Privacy"
  #keepassxc
  #tor-browser
  #yubikey-manager

  # "Runtime & Compatibility"
 # gnome-boxes    # virtual machines
 # wine

  # Nix Eco Utilities
  nix-index
  nix-tree


  ];

# ----- [ other enabled programs ] ------------------------------

  #fish shell
   programs.fish.enable = true;

  # kde connect
  # programs.kdeconnect.enable = true;

  # Install firefox
    #programs.firefox.enable = true;
    # programs.starship.enable = true;

  #appimagesupport
    programs.appimage = {
      enable = true;
      binfmt = true;
    };

  # Steam game store
    # programs.steam = {
      #enable = true;
      #remotePlay.openFirewall = true;
    #};
    # hardware.steam-hardware.enable = true;


# ----- [ local ai ] ----------------------------------------

  # ollama
    #services.ollama = {
    #enable = true;
    #acceleration = "cuda"; # Only for NVIDIA GPUs
    #};

  #OpenWebUI for ollama
    #services.open-webui.enable = true;


# ----- [ SERVICES and STUFF ] ------------------------------

  #forcing electron apps to use wayland
   environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      };


  # screen recording 
  # programs.gpu-screen-recorder.enable = true;

  #  printing
    #services.printing.enable = true;

  # Fail2ban 
    services.fail2ban.enable = true;

  # rtkit 
    security.rtkit.enable = true;


  # audio setup
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      };

  # Enable OpenSSH
  # services.openssh.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true; # For non FOSS software to be allowed


  # "Firmware updating software"
  services.fwupd.enable = true;

  # Bluetooth
   hardware.bluetooth.enable = true;

  # get rid of usb ethernet
   # networking.interfaces.enp0s20f0u2.ipv4.addresses = [];
   # networking.interfaces.enp0s20f0u2.ipv6.addresses = [];


# ----- [ power management ] ------------------------------

  #upower
   services.upower.enable = true;


  # "Power profiles"
  # services.power-profiles-daemon.enable = true;


  # TLP
  # Disable the standard daemon to avoid conflicts
  services.power-profiles-daemon.enable = false;

   services.tlp = {
    enable = true;
    settings = {

      # CPU Governor
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Internal Battery
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      # External Battery
      START_CHARGE_THRESH_BAT1 = 75;
      STOP_CHARGE_THRESH_BAT1 = 80;

      # Helps with overheating/throttling
      CPU_HWP_DYN_BOOST_ON_AC = 0;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
    };
   };

  # Thermald 
  services.thermald.enable = true;





# ----- [ FLAKES ] ------------------------------

 # yay flakes
 nix.settings.experimental-features = [ "nix-command" "flakes" ];


# ----- [ FIREWALL ] ------------------------------

 #networking.firewall.allowedTCPPorts = [ 22 80 443 ];  # SSH, HTTP, HTTPS
   networking.firewall.allowPing = true;
   networking.firewall.enable = true;

 #programs.steam.remotePlay.openFirewall = true; # In steam as service block of code. This line is just to remind that it exists.


# ----- [ AUTO UPDATES ] ------------------------------

  # thus will auto update nix os every friday at 4 am. 
  # but it wont be 4 am if pc was off at tht time
  #if thts the case it will update first time it turned on

  system.autoUpgrade = {
    enable = true;
    flake = "/home/yasiru/nixos-configs#nixos-btw"; 
  
    # Runs every Friday. "weekly" is also an option, 
    # but specific time is better to know if it happens 
    # if dont remeber why friday . cus if smthing breaks u hv a weekend to fix.(which wont happen tho)
    dates = "Fri *-*-* 04:00:00"; 
  
     persistent = true; # If the laptop was off Friday morning, it runs when you turn it on.
  
     flags = [
       "--update-input" "nixpkgs"
     ];
  
   allowReboot = false; 
  };


# ------- [ CLEANUP ] ------------------------------

  nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 30d";
  };

# deduplicates files to save even more space
nix.settings.auto-optimise-store = true;


# ----- [ STATE VERSION ] ------------------------------

  system.stateVersion = "25.11" ; # do not fucking change this
  # Did you read this comment? Lol


}

