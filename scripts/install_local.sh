#! /bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path

################################################################
echo_green "Installing from source"

for pkgname in $HOME/.dotfiles/source_packages/*;
do
	echo_green Building\ $pkgname;
	cd $pkgname; 
	makepkg -c -f -i;
done