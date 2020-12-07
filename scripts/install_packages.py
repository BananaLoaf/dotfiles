import os
import argparse


PACKAGES = {
    "security": {
        "gnome-keyring": "pacman",
        "seahorse": "pacman",
        "tor": "pacman",
        "torsocks": "pacman",
        "firejail": "pacman",
        "strace": "pacman",
        "gocryptfs": "pacman",
        "tunnelbear": "aur",
    },
    "media": {
        "pix": "aur",
        "gimp": "pacman",
        "lollypop": "pacman",
        "flameshot": "pacman",
        "transmission-qt": "pacman",
        "google-chrome": "aur",
        "sublime-text-3": "aur",
        "tor-browser": "aur",
        "dropbox": "aur",
        "spotify": "aur",
    },
    "social": {
        "telegram-desktop": "pacman",
        "discord": "pacman",
    },
    "development": {
        "dbeaver": "pacman",
        "gitkraken": "aur",
        "python37": "aur",
        "clion": "aur",
        "pycharm-community-edition": "pacman",
        "arduino": "aur",
        "arduino-pro-ide": "aur"
    },
    "personalization": {
        "latte-dock": "pacman",
        "lolcat": "pacman",
        "fish": "pacman",
        "plasma5-applets-window-buttons": "aur",
        "plasma5-applets-window-title": "aur",
        "plasma5-applets-eventcalendar": "aur",
        "buddhasay": "aur",
        "ulauncher": "aur",
    },
    "backup": {
        "timeshift": "aur",
        "btrbk": "aur",
    },
    "touchpad-gestures": {
        "ruby-fusuma": "aur.laptop",
        "ruby-fusuma-plugin-keypress": "aur.laptop"
    },
    "utilities": {
        "pulseaudio": "pacman",
        "pulseaudio-bluetooth": "pacman",
        "xdotool": "pacman",
        "gutenprint": "pacman",
        "ttf-opensans": "pacman",
        "grub-customizer": "pacman",
        "gparted": "pacman",
        "zip": "pacman",
        "unzip": "pacman",
        "etcher-bin": "aur",
        "inotify-tools": "pacman",
        "graphviz": "pacman",
        "wine": "pacman",
        "appmenu-gtk-module": "pacman",
        "intel-gpu-tools": "pacman",
        "imagemagick": "pacman",
        "kdialog": "pacman",
        "onlyoffice-bin": "aur",
        "gotop": "aur",
        "trezor-bridge-bin": "aur",
        "parsec-bin": "aur",
        "anydesk-bin": "aur",
        "ksysguard-gpu": "aur",
        "plasma-systemmonitor": "pacman",
        "vulkan-intel": "pacman"
    },
    "zluda": {  # https://github.com/vosen/ZLUDA
        "rust": "pacman",
        "intel-compute-runtime": "pacman",
        "intel-opencl": "aur",
        "level-zero-loader": "pacman",
        "cmake": "pacman",
        "cuda-10.1": "aur",
        "cudnn7-cuda10.1": "aur"
        # "spirv-tools": "pacman",
        # "spirv-headers": "pacman",
    }
}


if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Package installer")
	parser.add_argument("-l", "--laptop", action="store_true")
	parser.add_argument("-p", "--pacman", action="store_true")
	parser.add_argument("-a", "--aur", action="store_true")

	args = parser.parse_args()

	pacman_packages = []
	aur_packages = []

	for category in PACKAGES:
		for package, src in PACKAGES[category].items():
			if src.startswith("pacman"):
				if ".laptop" in src and args.laptop:
					pacman_packages.append(package)
				elif ".laptop" not in src:
					pacman_packages.append(package)

			elif src.startswith("aur"):
				if ".laptop" in src and args.laptop:
					aur_packages.append(package)
				elif ".laptop" not in src:
					aur_packages.append(package)

	if args.pacman:
		print("Installing pacman packages")
		os.system(f"sudo pacman -Sy --noconfirm --needed {' '.join(pacman_packages)}")

	if args.aur:
		print("Installing aur packages")
		os.system(f"yay -S --needed --noconfirm --batchinstall --noredownload --norebuild {' '.join(aur_packages)}")

