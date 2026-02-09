
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

### 1. Add Nixos-config to your flake and import the module'

### 2. Import in Configuration.nix

```
{
    
}
```

> Warning:
> xxxxxxx:
If you want to further customize Nixos you can use the following config options (given values are the default ones):

```
{

}
```

### 3. **Build and switch to the system configuration**:

```
{
}
```

### Experimental Features

To enable them in config set:
```

```

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
