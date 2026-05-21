# INTRODUCTION

> [!WARNING]
> This configuration repository is not primarily designed to be copied and
> used on random machines, proceed with caution.

## General directory structure
```
./
├── home/
│   ├── browser/
│   │   ├── librewolf.nix
│   │   └── ...
│   ├── ...
│   └── default.nix
├── hosts/
│   └── nixos/
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       ├── home.nix
│       └── packages.nix
├── modules/
│   ├── shell/
│   │   ├── fish.nix
│   │   └── ...
│   ├── ...
│   └── default.nix
├── flake.lock
├── flake.nix
└── README.md
```

- All nixos modules are located in `modules/`, and split into categories
- All home-manager modules are located in `home/`, and split into categories
- System specific configuration can be found in `/hosts`
