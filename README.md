# dotfiles for Manjaro KDE 20 on Lenovo S940

```bash
# Prepare the repo
git clone https://github.com/BananaLoaf/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles

# Sync package list
bash scripts/remove_packages.sh
sudo pacman -Syu
python scripts/install_packages.py

# Sync settings
chmod +x apps/.config/autostart-scripts/*
bash sync_app_settings.sh
bash sync_kde_settings.sh
bash sync_theme.sh

# Run other scripts
bash scripts/fix_lusk_btrfs_swap.sh
bash scripts/fix_vol_keys.sh
# Other kernels have hardware issues (touchpad, no sound)
sudo pacmac -S linux419
```
