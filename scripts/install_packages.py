from typing import List
import os


PACKAGES = {
    "security": {
        "gnome-keyring": "pacman", 
        "kgpg": "pacman",
        "seahorse": "pacman",
        "tor": "pacman",
        "torsocks": "pacman",
        "firejail": "pacman",
        "strace": "pacman",
        "gocryptfs": "pacman",
        "tunnelbear": "aur",
        "networkmanager-l2tp": "aur",
    },
    "media": {
        "pix": "pacman",
        "gimp": "pacman",
        "lollypop": "pacman",
        "flameshot": "pacman",
        "transmission-qt": "pacman",
        "plasma-browser-integration": "pacman",
        "google-chrome": "aur",
        "sublime-text-3-imfix": "aur",
        "tor-browser": "aur",
        "dropbox": "aur",
        "spotify": "aur",
        "google-play-music-desktop-player": "snap",
    },
    "social": {
        "telegram-desktop": "pacman",
        "rocketchat-desktop": "aur",
        "skype": "snap_classic",
        "whatsdesk": "snap",
        "discord": "snap",
    },
    "development": {
        "dbeaver": "pacman",
        "gcsfuse": "aur",
        "google-cloud-sdk": "aur",
        "gitkraken": "aur",
        "python37": "aur",
        "clion": "snap_classic",
        "pycharm-community": "snap_classic",
    },
    "personalization": {
        "paper-icon-theme-git": "pacman",
        "latte-dock": "pacman",
        "neofetch": "pacman",
        "lolcat": "pacman",
        "fish": "pacman",
        "plasma5-applets-window-buttons": "aur",
        "plasma5-applets-window-title": "aur",
        "buddhasay": "aur",
        "sweet-theme-git": "aur",
        "ulauncher": "aur",
    },
    "backup": {
        "deja-dup": "pacman",
        "timeshift": "pacman",
        "btrbk": "aur",
    },
    "touchpad-gestures": {
        "ruby-fusuma": "aur.laptop",
        "ruby-fusuma-plugin-keypress": "aur.laptop"
    },
    "utilities": {
        "gutenprint": "pacman",
        "ttf-opensans": "pacman",
        "grub-customizer": "pacman",
        "gparted": "pacman",
        "net-tools": "pacman",
        "zip": "pacman",
        "unzip": "pacman",
        "yay": "pacman",
        "etcher": "pacman",
        "time": "pacman",
        "inotify-tools": "pacman",
        "graphviz": "pacman",
        "wine": "pacman",
        "qt5-tools": "pacman",
        "appmenu-gtk-module": "pacman",
        "gotop": "aur",
        "trezor-bridge-bin": "aur",
    },
}


if __name__ == "__main__":
	laptop = True

	pacman_packages = []
	aur_packages = []
	snap_classic_packages = []
	snap_packages = []

	for category in PACKAGES:
		for package, src in PACKAGES[category].items():
			if src.startswith("pacman"):
				if ".laptop" in src and laptop:
					pacman_packages.append(package)
				elif ".laptop" not in src:
					pacman_packages.append(package)

			elif src.startswith("aur"):
				if ".laptop" in src and laptop:
					aur_packages.append(package)
				elif ".laptop" not in src:
					aur_packages.append(package)

			elif src.startswith("snap_classic"):
				if ".laptop" in src and laptop:
					snap_classic_packages.append(package)
				elif ".laptop" not in src:
					snap_classic_packages.append(package)

			elif src.startswith("snap"):
				if ".laptop" in src and laptop:
					snap_packages.append(package)
				elif ".laptop" not in src:
					snap_packages.append(package)


	print("Installing pacman packages")
	os.system(f"sudo pacman -Sy --noconfirm --needed {' '.join(pacman_packages)}")

	print("Installing snap_classic packages")
	for package in snap_classic_packages:
		os.system(f"sudo snap install {package} --classic")

	print("Installing snap packages")
	for package in snap_packages:
		os.system(f"sudo snap install {package}")

	print("Installing aur packages")
	os.system(f"yay -S --needed --noconfirm --batchinstall --noredownload --norebuild {' '.join(aur_packages)}")

