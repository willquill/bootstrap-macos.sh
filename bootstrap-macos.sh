#!/bin/sh

# Confirm function
# https://mike632t.wordpress.com/2017/07/06/bash-yes-no-prompt/
confirm() {
#
# syntax: confirm [<prompt>]
#
# Prompts the user to enter Yes or No and returns 0/1.
#
# This  program  is free software: you can redistribute it and/or modify  it
# under the terms of the GNU General Public License as published by the Free
# Software  Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This  program  is  distributed  in the hope that it will  be  useful,  but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public  License
# for more details.
#
# You  should  have received a copy of the GNU General Public License  along
# with this program. If not, see <http://www.gnu.org/licenses/>
#
#  04 Jul 17   0.1   - Initial version - MEJT
#
  local _prompt _default _response
 
  if [ "$1" ]; then _prompt="$1"; else _prompt="Are you sure"; fi
  _prompt="$_prompt [y/n] ?"
 
  # Loop forever until the user enters a valid response (Y/N or Yes/No).
  while true; do
    read -r -p "$_prompt " _response
    case "$_response" in
      [Yy][Ee][Ss]|[Yy]) # Yes or Y (case-insensitive).
        return 0
        ;;
      [Nn][Oo]|[Nn])  # No or N.
        return 1
        ;;
      *) # Anything else (including a blank) is invalid.
        ;;
    esac
  done
}

# Hostname function
hostname() {
	# Ask user for new hostnme
	read -p 'Enter new hostname for computer: ' hostnamevar
	echo

	# Renames the 3 below 
	/usr/sbin/scutil --set ComputerName $hostnamevar
	/usr/sbin/scutil --set HostName $hostnamevar
	/usr/sbin/scutil --set LocalHostName $hostnamevar

	echo $hostnamevar is now the ComputerName, HostName, and LocalHostName
}

# Change hostname
if confirm "Do you want to change hostname?"; then hostname; else echo Skipped change hostname; fi
echo

# Install brew
if confirm "Do you want to install brew?":
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew tap homebrew/cask
  echo Brew successfully installed
else echo You kinda need brew for this to work but okay; echo
fi

# Install Command Line Tools for Xcode
if confirm "Do you want to install Command Line Tools for Xcode?"
then xcode-select --install
else echo Skipping Command Line Tools for Xcode; echo
fi

# Lists of apps and cask apps you want to install
# If you are customizing this script, these are the two lines you want to edit
apps=(curl git vim)
cask_apps=(archiver coconutbattery discord firefox hiddenbar omnidisksweeper postman spotify steam sublime-text visual-studio-code vlc zoom clicker-for-youtube balenaetcher handbrake microsoft-remote-desktop plex telegram-desktop signal tor-browser pocket-casts raycast transmission)

# Prompts to install all apps or apps individually
if confirm "Do you want to install ALL of the following apps: ${apps[*]} ${cask_apps[*]}?"
then
  # Install all apps
  for i in "${apps[@]}"
  do
    brew install $i && echo Successfully installed $i. && echo
  done 
  # Install all cask apps
  for i in "${cask_apps[@]}"
  do
    brew install --cask $i && echo Successfully installed $i. && echo
  done 
else
  echo
  # Ask before each app
  for i in "${apps[@]}"
  do
    if confirm "Do you want to install $i?"; then brew install $i
    else echo Skipping $i && echo
    fi
  done
  # Ask before each cask app 
  for i in "${cask_apps[@]}"
  do
    if confirm "Do you want to install $i?"; then brew install --cask $i
    else echo Skipping $i && echo
    fi
  done
fi

echo Script is complete
