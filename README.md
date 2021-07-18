# dotfiles for EndeavourOS on Lenovo S940

## Prep
```bash
git clone https://github.com/BananaLoaf/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles


# Backups and stuff
# yay -S linux-lts419  # Just in case
yay -S timeshift
sudo pacman -Syyy grub-btrfs
timeshift-launcher  # Start and configure

sudo systemctl enable cronie.service
sudo systemctl start cronie.service

sudo mkdir /etc/systemd/system/grub-btrfs.path.d
echo -e "[Path]\nPathModified=/run/timeshift/backup/timeshift-btrfs/snapshots\n" | sudo tee -a /etc/systemd/system/grub-btrfs.path.d/override.conf
sudo systemctl enable grub-btrfs.path
sudo systemctl start grub-btrfs.path

# Fixes
bash scripts/fix_lusk_btrfs_swap.sh
bash scripts/fix_vol_keys.sh  # Not sure if usefull anymore
sudo nano /etc/pam.d/sddm  # or bash scripts/gnome_keyring_autostart.sh but it doesn't work


# Battety optimizations
sudo pacman -S tlp powertop

sudo systemctl enable tlp.service
sudo systemctl start tlp.service

sudo cp misc/powertop.service /etc/systemd/system/powertop.service
sudo powertop --calibrate
sudo systemctl enable powertop.service
sudo systemctl start powertop.service

# Backup
sudo mkinitcpio -P
timeshift-launcher

reboot
```

## Personalize
```bash
# SDDM
bash sync_sddm_theme.sh

# Sync packages
bash scripts/remove_packages.sh
sudo pacman -Syu
python scripts/install_packages.py
bash scripts/install_local.sh

# Sync settings
chmod +x apps/.config/autostart-scripts.syncpoint/*
bash sync_app_settings.sh
bash sync_kde_settings.sh
bash sync_kde_theme.sh
```
