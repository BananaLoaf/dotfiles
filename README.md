# dotfiles for Manjaro KDE on Lenovo S940

## Guide

Install ChromeOS and Sweet global themes manually

```bash
# Prepare the repo
git clone https://github.com/BananaLoaf/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles

# Run other scripts
bash scripts/fix_lusk_btrfs_swap.sh
bash scripts/gnome-keyring-autostart.sh
bash scripts/fix_touchpad.sh  # Doesn't do anything

# Sync package list
bash scripts/remove_packages.sh
sudo pamac update
bash scripts/install_packages.sh

# Sync settings
chmod +x kde/.config/autostart-scripts/*
bash sync_app_settings.sh
bash sync_kde_settings.sh
bash sync_theme.sh
```

## TODO

1. Add Sweet KDE - https://store.kde.org/p/1294729 installer
2. Add ChromeOS - https://store.kde.org/p/1354062 installer
