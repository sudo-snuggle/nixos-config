
# NixOS + Niri + Noctalia Shell 

*just my personal nixos setup*

---

## 🖥️ System Overview

* **os**: NixOS
* **wm**: niri
* **shell**: noctalia shell

---

## 📁 Directory Overview

<details>
<summary>tree .</summary>

```
NIXOS-CONFIG
├── home/
│   ├── media/
│   │   └── spicetify.nix
│   ├── programs/
│   ├── shell/
│   │   ├── fish.nix
│   │   └── noctalia.nix
│   ├── terminal/
│   │   ├── alacritty.nix
│   │   └── fastfetch.nix
│   └── web/
│       └── zen.nix
├── modules/
│   ├── fonts/
│   │   └── fonts.nix
│   └── packages/
│       └── essentials.nix
├── configuration.nix
├── flake.lock
├── flake.nix
├── hardware-configuration.nix
└── home.nix
```

</details>

---
## Installation 

follow the manual installation process:

### 1. Download the Config

this wil tempor

```
nix-shell -p git --run "git clone https://github.com/sudo-snuggle/nixos-config.git ."
```

### 2. Copy your hardware-configuration.nix 

```
cp /etc/nixos/hardware-configuration.nix ~/nixos-config/hardware-configuration.nix
```

### 3. run the flake

```
cd ~/nixos-configs
git add .
sudo nixos-rebuild test --flake .#nixos-btw

```

**For best results:**


---

## Features


---

## Showcase


</details>


---

## Final Thooughts
