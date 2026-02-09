# NixOS + Niri + Noctalia Shell

A beautiful NixOS setup with niri and noctalia shell

🖥️ System Overview

    OS: NixOS (Unstable)

    WM: Niri

    Shell: Noctalia

    Terminal: Alacritty / Foot

📁 Structure

<details> <summary>Click to view directory tree</summary>

```
NIXOS-CONFIG
├── home/
│   ├── media/
│   │   └── spicetify.nix
│   ├── programs/
│   ├── shell/
│   │   ├── fish.nix
│   │   └── noctalia.nix
│   ├── terminal/
│   │   ├── alacritty.nix
│   │   └── fastfetch.nix
│   └── web/
│       └── zen.nix
├── modules/
│   ├── fonts/
│   │   └── fonts.nix
│   └── packages/
│       └── essentials.nix
├── configuration.nix
├── flake.lock
├── flake.nix
├── hardware-configuration.nix
└── home.nix
```

</details>
🚀 Installation

This guide assumes you have already performed a basic NixOS installation via the GUI/Calamares installer.
1. Clone the Repository

Clone this into your home folder:
Bash

git clone https://github.com/sudo-snuggle/nixos-config.git ~/nixos-config
cd ~/nixos-config

2. Import Hardware Specs

You must use the hardware file generated for your specific machine:
Bash

cp /etc/nixos/hardware-configuration.nix ~/nixos-config/hardware-configuration.nix

3. Apply the Config
Bash

git add .
sudo nixos-rebuild switch --flake .#nixos-btw

⚠️ Important Notes

    [!CAUTION] Git Tree is Dirty: You will see a warning saying Git tree is dirty. Ignore it. This just means you haven't committed your hardware-configuration.nix yet. The installation will work fine.

    [!IMPORTANT] State Version: Ensure the system.stateVersion in configuration.nix matches the version you originally installed. Do not change this unless you know what you are doing.

    [!TIP] Post-Install: After the first reboot, run sudo passwd yasiru to ensure your user password is set correctly.

✨ Features

    Ozone Wayland: Electron apps forced to native Wayland.

    Power Management: Optimized for ThinkPads via TLP and Thermald.

    Clean CLI: Modern replacements like eza, zoxide, and bat pre-configured.

📸 Showcase

(Insert your screenshots here)
