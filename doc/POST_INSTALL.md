# Things to do after installing Linux
> [!NOTE]
> All steps are optional and can be skipped.

The steps are aimed at desktop users and may not be applicable to server users.


## Distrobutions
The following distrobutions have been tested.
* Ubuntu 20.04 LTS
* Ubuntu 22.04 LTS


## Hardware
The following hardware has been tested.
* Dell XPS 15 9560
* Custom PC
    * ROG CROSSHAIR GENE
    * AMD Ryzen 9
    * 96GB DDR5
    * NVIDIA RTX 50000 Ada

> [!NOTE]
> **Dell XPS 15 9560**
> Ajust color profile, selected Colorspace: sRGB.

> [!TIP]
> Enable [Ubuntu Pro](https://ubuntu.com/pro)

> [!IMPORTANT]
> Install [clamav](https://www.linuxcapable.com/how-to-install-clamav-on-ubuntu-linux)


## Requirements
See [requirements](../README.md#requirements).


## Create Working Directory
```bash
mkdir --parents ${HOME}/Downloads/Configure
```


## Fonts
```bash
mkdir ${HOME}/.fonts
```


### Cascadia Code
```bash
cd ${HOME}/Downloads/Configure
wget --quiet https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip
unzip CascadiaCode-2111.01.zip
mv ttf/*.ttf ${HOME}/.fonts
fc-cache --force --verbose
rm -rf ~/Downloads/Configure/*
```


### Cascadia Code Nerd Font
```bash
wget --quiet https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/CascadiaCode.zip
unzip CascadiaCode.zip
mv CaskaydiaCoveNerdFont-{Regular,Italic,Bold,BoldItalic}.ttf ${HOME}/.fonts
fc-cache --force --verbose
rm -rf ~/Downloads/Configure/*
```


## Numix Square Icons
```bash
sudo add-apt-repository ppa:numix/ppa
sudo apt update && sudo apt install numix-icon-theme-square
```

<!--
TODO: sort out _update_all icon update script for snaps…
copy _update_* to /var/lib/snapd/desktop/applications
run _update_all as root
-->


## kiTTY
```bash
KITTY_BIN=${HOME}/.local/kitty.app/bin
KITTY_APP=${HOME}/.local/kitty.app/share/applications
curl --location https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln --symbolic --force ${KITTY_BIN}/kitty ${KITTY_BIN}/kitten ${HOME}/.local/bin/
cp ${KITTH_APP}/kitty.desktop ${HOME}/.local/share/applications/
cp ${KITTH_APP}/kitty-open.desktop ${HOME}/.local/share/applications/
sed --in-place "s|Icon=kitty|Icon=/usr/share/icons/Numix-Square/48/apps/kitty.svg|g" ${KITTY_APP}/kitty*.desktop
sed --in-place "s|Exec=kitty|Exec=/home/${USER}/.local/kitty.app/bin/kitty|g" ${KITTY_APP}/kitty*.desktop
```


## Install `decor8r`
See [install `decor8r`](../README.md#install).

> [!IMPORTANT]
> Restart before continuing!


## Install gnome-tweaks
1. Map `Caps Lock` to `Ctrl`.


<!--
### Install Git Extras
    10. git-doc
    20. git-lfs
### Install Snaps
    10. Brave
        10. Add Dashlane
        20. Add Raindrop.io
        30. Add Vimium
        40. GNOME Shell Integration
    20. Visual Studio Code
    30. Chromium
    40. htop
    50. PowerShell
    60. Remmina
    70. Slack
    80. slides
### Enabled Compose Key (in settings app)
### Install GNOME Extensions
-->


## Install Docker Engine
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
```


## Create zfs filesystems
```bash
sudo zfs create -o mountpoint=/home/axl/Projects rpool/USERDATA
sudo zfs create -o mountpoint=/home/axl/Projects/AxlER8R rpool/USERDATA/axler8r_<id>
sudo zfs create -o mountpoint=/home/axl/Projects/InvestIG8R rpool/USERDATA/investig8r_<id>
sudo zfs create -o mountpoint=/home/axl/Doodle rpool/USERDATA/doodle_<id>
```


## Reboot
