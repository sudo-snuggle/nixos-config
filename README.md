
# NixOS + Niri + Noctalia Shell 

*simple opinianated nixos *

---

## 🖥️ System Overview

* **os**: NixOS
* **wm**: niri
* **shell**: noctalia shell

<p align="center">
  <b>📸 Setup Showcase</b>
  <br>
  <img src="Assets/Screenshot from 2026-02-09 23-50-07.png" width="48%" />
  <img src="Assets/Screenshot from 2026-02-09 23-46-19.png" width="48%" />
  <br>
  <img src="Assets/Screenshot from 2026-02-09 23-47-09.png" width="48%" />
  <img src="Assets/Screenshot from 2026-02-09 23-47-52.png" width="48%" />
  
</p>
---

## 📁 Directory Overview

<details>
<summary>Click to view directory tree .</summary>

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
│   ├── power/
│   │   ├── thinkfan.nix
│   │   └── undervolt.nix
│   └── packages/
│       └── essentials.nix
├── configuration.nix
├── flake.lock
├── flake.nix
├── hardware-configuration.nix
└── home.nix
```

</details>

---
## 🚀 Installation 

This guide assumes you have already performed a basic NixOS installation via the GUI/Calamares installer.

### 1. Clone the Repository

Clone this into your home folder:

```
nix-shell -p git --run "git clone https://github.com/sudo-snuggle/nixos-config.git ."
cd ~/nixos-config
```

**⚠️important:**

 State Version: Ensure the system.stateVersion in configuration.nix matches the version you originally installed. Do not change this unless you know what you are doing
 

### 2. Copy your hardware-configuration.nix 

You must use the hardware file generated for your specific machine:

```
cp /etc/nixos/hardware-configuration.nix ~/nixos-config/hardware-configuration.nix
```

### 3. Apply the Config

```
git add .
sudo nixos-rebuild test --flake .#nixos-btw
```

[!NOTE] First Install Size: The initial build may download several gigabytes of data (approx. 12GB)



---

##  🛠️ after Installation 

### 1. Set your Password

By default, this config creates a user named yasiru. u hv set a password after rebooting:

```
sudo passwd yasiru
```

---

## ✨ Packages and Features

* **Browsing**       : Zen Browser & Brave
* **Music**          : Spicetify (Themed Spotify)
* **Terminal**: Alacritty & Kitty
* **File Management**: Yazi (TUI) & Thunar (GUI)
* **Editors**: VSCodium & Neovim
* **CLI Tools**: Modern replacements (`eza`, `zoxide`, `bat`, `fzf`)
* **Shell**: Fish Shell (Themed with Noctalia)
* **Wayland**: Ozone layer enabled (Forces Electron apps to native Wayland)
* **Power**: TLP & Thermald 
* 
* **Auto-Updates**: Scheduled system updates every Friday morning
* **Auto-Cleanup**: Weekly garbage collection for old system generations

> You can customize update schedules and cleanup rules at the bottom of the `configuration.nix` file.



## Showcase

https://github.com/sudo-snuggle/nixos-config/issues/1#issue-3917603692

</details>


---

## Final Thooughts

:3
