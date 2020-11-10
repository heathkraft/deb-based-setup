
# This will setup my primary computer after I complete my new build.
# After that, it will mostly serve as a collection of commands for installing apps that I will use piece-meal for other scripts.

sudo rm /etc/apt/sources.list.d/preinsta*
# Clean apt-cache, refresh, and upgrade all currently installed apps in preparation for the rest of the setup script.
sudo apt clean
sudo apt update
sudo apt full-upgrade -yy

# Basic Linux mgmt apps
dpkg -l | grep -qw apt-transport-https || sudo apt install -yyq apt-transport-https
dpkg -l | grep -qw grub-customizer || sudo apt install -yyq grub-customizer
dpkg -l | grep -qw aptitude || sudo apt install -yyq aptitude
dpkg -l | grep -qw tasksel || sudo apt install -yyq tasksel
dpkg -l | grep -qw curl || sudo apt install -yyq curl
dpkg -l | grep -qw muon || sudo apt install -yyq muon
dpkg -l | grep -qw less || sudo apt install -yyq less
sudo dpkg --add-architecture i386

# Kernels, Drivers, config/personalization
#-Custom kernels
#---Liquorix
#sudo add-apt-repository --yes ppa:damentz/liquorix
#sudo apt install -yyq linux-image-liquorix-amd64 linux-headers-liquorix-amd64
#---Xanmod
#echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -
#sudo apt update && sudo apt install linux-xanmod
#-Drivers and config apps
sudo ubuntu-drivers autoinstall
#---Roccat
#---Ducky
#-Umm... other apps...
sudo apt install -yyq ubuntu-restricted-extras
sudo apt install -yyq latte-dock
sudo apt install -yyq yakuake

# General PC usage apps
#-Browsers
#---Brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -yyq brave-browser
#---Chromium
#?sudo apt install -yyq chromium-browser
#---Chrome
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -n google-chrome-stable_current_amd64.deb
#rm google-chrome-stable_current_amd64.deb
#---Edge
#-Office apps
#---Thunderbird
sudo add-apt-repository --yes ppa:timo-jyrinki/thunderbird78
dpkg -l | grep -qw thunderbird || sudo apt install -yyq thunderbird
#---LibreOffice
sudo add-apt-repository --yes ppa:libreoffice/libreoffice-7-0
sudo apt install -yyq libreoffice
#---Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
#-Multimedia
dpkg -l | grep -qw vlc || sudo apt install -yyq vlc
clementine
# Spotify
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
#echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#sudo apt update && sudo apt install -yyq spotify-client


# Personal eco-system
#-Remote 'control'
#---TeamViewer
#wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
#sudo dpkg -i --force-depends teamviewer_amd64.deb
sudo apt --fix-broken install
rm teamviewer_amd64.deb
#---Barrier
remmina
ssh
#-Cloud storage/sync
#---Rclone and browser
sudo apt install -yyq rclone-browser
curl https://rclone.org/install.sh | sudo bash
#   -Onedrive
#   -Googledrive
#   -Mega
#   -Googlephotos

# Project tools
dpkg -l | grep -qw python3 || sudo apt install -yyq python3
dpkg -l | grep -qw python3-pip || sudo apt install -yyq python3-pip
dpkg -l | grep -qw git || sudo apt install -yyq git
#---VSCode
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install -yyq code
#---Notepadqq
sudo apt install -yyq notepadqq
#---Powershell
#wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
#sudo apt install packages-microsoft-prod.deb
#rm packages-microsoft-prod.deb
#sudo apt update && sudo apt install -yyq powershell
#---Brackets
#---FreeCAD
sudo snap install freecad
sudo add-apt-repository --yes ppa:freecad-maintainers/freecad-stable
#dpkg -l | grep -qw freecad || sudo apt install -yyq freecad
#---KiCAD
sudo add-apt-repository --yes ppa:kicad/kicad-5.1-releases
dpkg -l | grep -qw kicad || sudo apt install -yyq kicad
#---Arduino
dpkg -l | grep -qw arduino || sudo apt install -yyq arduino

# Content creation
GIMP
dpkg -l | grep -qw inkscape || sudo apt install -yyq inkscape
dpkg -l | grep -qw audacity || sudo apt install -yyq audacity
Blender
#---Kdenlive
sudo add-apt-repository --yes ppa:kdenlive/kdenlive-stable
#sudo apt install -yyq kdenlive
#---OBS
sudo add-apt-repository --yes ppa:obsproject/obs-studio
sudo apt install -yyq obs-studio
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Gaming
#---Steam
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb
sudo dpkg -i steam.deb && rm steam.deb
#---Lutris
sudo add-apt-repository --yes ppa:lutris-team/lutris
sudo apt install -yyq lutris
gog 
#---XBox controller
sudo apt install -yyq xboxdrv
echo 'options bluetooth disable_ertm=Y' | sudo tee -a /etc/modprobe.d/bluetooth.conf

# Comms
teams
zoom
discord

# Privacy/Security
tor
#---OnionShare
#sudo add-apt-repository ppa:micahflee/ppa
#sudo apt install -yyq onionshare
#---Signal
#curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
#sudo apt update && sudo apt install -yyq signal-desktop
protonmail
-vpn--wireguard


# Remove Fluendo mp3 codec if installed.
sudo apt purge -yyqq gstreamer1.0-fluendo-mp3

sudo sed -i 's/focal/groovy/g' /etc/apt/sources.list
sudo apt clean
sudo apt update
sudo apt full-upgrade -yy
sudo apt autoremove -yy
sudo apt autoclean

echo "-------------------"
echo "- Setup Complete! -"
echo "-------------------"

# --Laptop - move this to a switchable function
    tlp
    auto-cpu-freq