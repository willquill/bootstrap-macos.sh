# bootstrap-macos

Bootstrap a macOS system

# How To Use This

First, clone the repo.

Then modify the `apps` and `cask_apps` lists in `bootstrap-macos.sh` to specify the exact apps you need.

You can use this page as a reference to create your custom lists: [https://formulae.brew.sh/formula/](https://formulae.brew.sh/formula/)

After you customize the apps, make the script executable

`chmod +x bootstrap-macos.sh`

Run the script to install your apps with prompts

`./bootstrap-macos.sh`