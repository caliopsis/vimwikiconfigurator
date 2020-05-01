# vimwikiconfigurator

This is a small bash script that sets up terminal versions of vim to be useful with the excellent vimwiki plugin by Nudin (https://github.com/vimwiki/vimwiki).

## What this script does

1. Installs Pathogen as vim's plugin manager.
2. Installs the vimwiki plugin. 
3. (Optionally) Installs lusty, a plugin by sjbach (https://github.com/sjbach/lusty) that is very useful for navigating buffers. 
4. (Optionally) Offers to install one of five vim themes that I have worked with and enjoyed, including Gruvbox, Molokai, Solarized, Zenbur, and atom-dark. (If you examine the contents of the script, the links for each are provided.) While there are many excellent themes available for vim, these reperesent some options that I personally thought worked well with vimwiki.

## How to use

You can just download and run the script from the terminal, assuming you have BASH. If you need to make it exectuable, simply chmod +x vimsetup.sh and then run with ./vimsetup.sh or sh vimsetup.sh

## Todo

1. Make it play a little nicer with .vimrc when configuring the themes. If the theme doesn't load, simply check that no other theme is set in your .vimrc.
2. Add features as I think of them.
3. Start a new project because as I write this README I realize that vimwikiconfigurator is misleading for what I ultimately have in mind. 

## Other

If you have any feature requests I would love to hear them. I am an extreme amature, though. Be warned. 
