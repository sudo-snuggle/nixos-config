
# NixOS+Niri+noctalia shell (dont use this yet)

*nixos configfiles. which niri (wayland compositor) and conctalia shell*

just my personal nixos setup

---

## 🖥️ System Overview

* **os**: NixOS
* **wm**: niri
* **shell**: noctalia shell

---

## 📁 Directory Overview

<details>
<summary>tree .</summary>

```bash
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

### 1. Add Nixos-config to your flake and import the modul`

### 2. Import in Configuration.nix

You can configure Nixos95 under the `nixos95` namespace. For a minimal config just set:
```
{
    nixos95.enable = true;
}
```

> Warning: This will activate the xfce desktop manager, as well as lightdm and ssdm as display manager.
> You might want to disable your other desktop environment to prevent bugs.

If you want to further customize Nixos95 you can use the following config options (given values are the default ones):

```nix
{
```

### 3. **Build and switch to the system configuration**:

```bash
sudo NIX_CONFIG="experimental-features = nix-command flakes pipe-operators" nixos-rebuild switch --flake .#default
```

### Experimental Features

To enable them in your config set:
```nix
nix.settings.experimental-features = [
  "flakes" "pipe-operators"
];
```

### Rebuild Notes

Due to how **Home Manager** and XFCE handle theming, changes may not fully apply on the first attempt.

**For best results:**

1. Rebuild twice
2. Log out and back in after each rebuild

---

## Features


---

## Showcase


</details>


---

## Final Thooughts
