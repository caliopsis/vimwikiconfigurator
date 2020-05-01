#!/bin/bash

# some variables
VVIM="$(whereis vim)"
DISTRO="$(cat /etc/*-release |sed -n 1p)"
PATHOGEN=~/.vim/autoload/pathogen.vim
VIMWIKI=~/.vim/bundle/vimwiki
LUSTY=~/.vim/bundle/lusty
GRUVBOX=~/.vim/bundle/gruvbox
MOLOKAI=~/.vim/colors/molokai
SOLARIZED=~/.vim/bundle/vim-colors-solarized
ZENBURN=~/.vim/colors/zenburn
VAD=~/.vim/colors/vim-atom-dark

# Disclaimer!
echo " " 
echo "THIS SCRIPT IS GEARED TOWARDS THOSE USING VIM IN A TERMINAL." 
echo "I AM NOT FAMILIAR WITH GUI VERSIONS."
echo " "

# let's do this!
echo "Let's get you set up..."
sleep 3 
echo "You're running $DISTRO, nice!"
sleep 3
echo "If the next line is empty, you need to check if you have installed vim!"
sleep 3
echo "You have vim installed to $VVIM"
sleep 3
echo " " 
echo "Make ~/.vim/autoload and ~/.vim/bundle if they don't exist already..."
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
sleep 3

echo "Do you have Pathogen installed?..."
if test -f "$PATHOGEN"; then
	echo "$PATHOGEN is installed already."
	sleep 3
	echo "Moving on..."
	sleep 2
else
	echo "$PATHOGEN is not installed. Installing now..."
	git clone https://github.com/tpope/vim-pathogen.git
	cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
	touch ~/.vimrc
	echo "execute pathogen#infect()" >> ~/.vimrc
	echo "syntax on" >> ~/.vimrc
	echo "filetype plugin indent on" >> ~/.vimrc
	sleep 3 "Pathogen is now installed!"
fi

echo "Time to install vimwiki..."
echo "				"
if test -d  "$VIMWIKI"; then
	echo "$VIMWIKI exists. Assuming vimwiki is installed. Moving on..."
else
	echo "$VIMWIKI does not exist. Installing now..."
	git clone https://github.com/vimwiki/vimwiki.git
	echo "set nocompatible" >> ~/.vimrc
	echo "filetype plugin on" >> ~/.vimrc

	echo "Alright! Vimwiki is now installed!"
	sleep 3
fi

echo "All right, that's everything! Here some additional options..."
echo "							           "
echo "1. lusty-juggler: A plugin for quickly switching buffers. Useful for working with multiple wiki pages at once."
echo " "
read -n1 -p "Install LustyJuggler Plugin? (y/n): " doit
case $doit in
	y|Y)
	       	echo " "
	        if test -d "$LUSTY"; then
			echo "$LUSTY exists. Plugin is already installed!"
		else
			git clone https://github.com/sjbach/lusty.git
			mv lusty ~/.vim/bundle
			echo "Plugin installed. To learn more about it, go to https://github.com/sjbach/Lusty"
		fi 
		;;
	n|N)
		echo " "
		echo " "
		echo "Okay!"
		echo " "
	       	;;
	*)
		echo " " 
		echo "Invalid answer. It's perfectly safe to simply re-run this script, though!"
esac
echo " " 
echo "2. Themes: Not really that important, but themes are a lot of fun."
echo " " 
read -n1 -p "Would you like to view some themes? (y/n): " themes
case $themes in
	y|Y)
		echo " " 
		echo "Opening links for several themes in your web broswer..."
		echo "Check back in this window after browsing the themes!"
		sleep 5
		echo " " 
		xdg-open https://github.com/morhetz/gruvbox
		xdg-open https://github.com/tomasr/molokai
		xdg-open https://github.com/altercation/vim-colors-solarized
		xdg-open https://github.com/jnurmine/Zenburn
		xdg-open https://github.com/gosukiwi/vim-atom-dark
		echo " "
		echo "The options presented are: "
		echo "1. Gruvbox"
		echo "2. Molokai"
		echo "3. Solarized"
		echo "4. Zenburn"
		echo "5. vim-atom-dark"
		echo " "
		read -n1 -p "Choose which theme to install (1-5; 0 cancels): " whichtheme
		case $whichtheme in
			1)
				echo " "
				if test -d "$GRUVBOX"; then
					echo "Gruvbox already installed!"
				else
					git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
					echo "colorscheme gruvbox" >> ~/.vimrc
					echo " "
					echo "Gruvbox installed!"
					echo " "
				fi
				;;
			2)
				echo " "
				if test -d "$MOLOKAI"; then
					echo "Molokai is already installed!"
				else
					git clone https://github.com/tomasr/molokai.git
					mv molokai/colors/molokai.vim ~/.vim/colors/
					echo "colorscheme molokai" >> ~/.vimrc
					echo " "
				fi
				;;
			3)
				echo " " 
				if test -d "$SOLARIZED"; then
					echo "Solarized is already installed!"
				else
					cd ~/.vim/bundle
					git clone git://github.com/altercation/vim-colors-solarized.git
					echo "syntax enable" >> ~/.vimrc
					echo "set background=dark" >> ~/.vimrc
					echo "colorscheme solarized" >> ~/.vimrc
					echo "Solarized is installed!"
					echo " "
				fi
				;;
			4)
				echo " "
				if test -d "$ZENBURN"; then
					echo "Zenburn is already installed!"
				else
					cd ~/.vim/colors
					git clone https://github.com/jnurmine/Zenburn.git
					echo "This theme requires 256-color mode, so we'll enable that now..."
					export TERM=xterm-256-color
					echo "set t_Co=265" >> ~/.vimrc
					echo "Zenburn installed!"
					echo " "
				fi
				;;
			5)
				echo " "
				if test -d "$VAD"; then
					echo "vim-atom-dark is already installed!"
				else
					cd ~/.vim/colors
					git clone https://github.com/gosukiwi/vim-atom-dark.git
					mv vim-atom-dark/colors/atom-dark.vim ~/.vim/colors/
					mv vim-atom-dark/colors/atom-dark-256.vim ~/.vim/colors
					echo " "
					echo "There are two versions of this theme. This script installs the atom-dark.vim. If you prefer to install the 256 color version, change the line 'colorscheme foo' to colorscheme atom-dark-256.vim in ~/.vimrc"
					echo "colorscheme atom-dark" >> ~/.vimrc
					echo "vim-atom-dark installed!"
					echo " "
				fi
				;;
			0)
				echo " " 
				echo "Okay, we won't install any themes!"
				;;
		esac
		;;
	n|N)
		echo " " 
		echo "Okay! I won't force you to install a theme!"
esac
echo " " 
echo "That's all for this script! Have fun!"
