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
        "networkmanager-l2tp": "aur"
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
    },
    "social": {
        "telegram-desktop": "pacman",
        "rocketchat-desktop": "aur",
        "whatsapp-nativefier": "pacman",
        "discord": "pacman",
    },
    "development": {
        "dbeaver": "pacman",
        "gitkraken": "aur",
        "python37": "aur",
        "clion": "aur",
        "pycharm-community-edition": "pacman",
    },
    "personalization": {
        "latte-dock": "pacman",
        "neofetch": "pacman",
        "lolcat": "pacman",
        "fish": "pacman",
        "plasma5-applets-window-buttons": "aur",
        "plasma5-applets-window-title": "aur",
        "buddhasay": "aur",
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
        "xdotool": "pacman",
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
        "intel-gpu-tools": "pacman",
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


	print("Installing pacman packages")
	os.system(f"sudo pacman -Sy --noconfirm --needed {' '.join(pacman_packages)}")

	print("Installing aur packages")
	os.system(f"yay -S --needed --noconfirm --batchinstall --noredownload --norebuild {' '.join(aur_packages)}")

