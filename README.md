# bootstrap-macos

Bootstrap a macOS system

# How to use this

First, clone the repo.

Then modify the `apps` and `cask_apps` lists in `bootstrap-macos.sh` to specify the exact apps you need.

You can use this page as a reference to create your custom lists: [https://formulae.brew.sh/formula/](https://formulae.brew.sh/formula/)

After you customize the apps, make the script executable.

`chmod +x bootstrap-macos.sh`

Run the script to install your apps with prompts.

`./bootstrap-macos.sh`

# Upgrading these apps

The following line will upgrade the apps that need to be upgraded.

`brew update && brew outdated && brew upgrade`

# App descriptions

Not all of the script's apps are described here - only some of the more niche ones. I included individual commands for these in case you remove them from the script but want to come back later and install via copy and paste.

Standalone YouTube app that blocks ads

`brew install --cask clicker-for-youtube`

Create bootable USB drives

`brew install --cask balenaetcher`

Bitwarden, my preferred password manager

`brew install --cask bitwarden`

Handbrake for video encoding

`brew install --cask handbrake`

Grammarly helps fix mistakes whiel you write

`brew install --cask grammarly-desktop`

Microsoft Remote Desktop, my preferred RDP client

`brew install --cask microsoft-remote-desktop`

Plex for streaming media locally or remotely

`brew install --cask plex`

Telegram, my preferred multi-device chat app

`brew install --cask telegram-desktop`

Signal, my preferred chat app for encrypted conversations

`brew install --cask signal`

Tor Browser for more anonymous browsing

`brew install --cask tor-browser`

Authy, my preferred 2FA app

`brew install --cask authy`

Pocket Casts, my preferred podcast app

`brew install --cask pocket-casts`

Wireshark for TCP/IP network analysis

`brew install --cask wireshark`

Virtualbox to use virtual machines (useful when using minikube)

`brew install --cask virtualbox`

Transmission for torrents

`brew install --cask transmission`

Raycast as Spotlight on steroids

`brew install --cask raycast`

# Other apps

These apps and extensions are not part of the script, but they are recommended:

- [Ninja Cookie](https://ninja-cookie.com)
    - Automatically say no to cookies
- [Dropover](https://dropoverapp.com)
    - Helps drag 'n drop in Finder
- [Honey for Safari](https://apps.apple.com/us/app/honey-for-safari/id1472777122)
    - Find discounts when shopping
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704)
    - Keeps laptop awake
- [Pocket](https://apps.apple.com/us/app/pocket/id568494494)
    - Save articles for later
- [Unsplash Wallpapers](https://apps.apple.com/us/app/unsplash-wallpapers/id1284863847)
    - Wallpapers
- [Swish](https://highlyopinionated.co/swish/)
    - Window management
- [AdGuard](https://adguard.com/en/adguard-mac/overview.html) or [Wipr](https://apps.apple.com/us/app/wipr/id1320666476)
    - Block ads - comparison of options [here](https://www.reddit.com/r/Safari/comments/oqsbxo/with_ublock_origin_not_being_available_for_safari/)


# Other tweaks

### Speed up dock hide animation

In terminal, customize to your preference:

```sh
defaults write com.apple.dock autohide-time-modifier -float 0.15;killall Dock
defaults write com.apple.Dock autohide-delay -float 0; killall Dock
```

Returning to the defaults:

```sh
defaults delete com.apple.dock autohide-time-modifier;killall Dock
defaults delete com.apple.Dock autohide-delay; killall Dock
```

### Neat ZSH profile

Check out `prezto` [here](https://github.com/sorin-ionescu/prezto) for a nice all in one ZSH customized profile.




