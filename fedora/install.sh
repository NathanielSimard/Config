#!/bin/bash

echo "Update"
sudo dnf update -y

echo "Adding Visual Studio Code repositoty"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update -y
sudo dnf install -y code

echo "Enable RpmFusion"
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Enable Flathub"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing codecs"
sudo dnf install -y \
    gstreamer-plugins-bad \
    gstreamer-plugins-bad-free-extras \
    gstreamer-plugins-bad-nonfree \
    gstreamer-plugins-ugly \
    gstreamer-ffmpeg \
    gstreamer1-libav \
    gstreamer1-plugins-bad-free-extras \
    gstreamer1-plugins-bad-freeworld \
    gstreamer1-plugins-base-tools \
    gstreamer1-plugins-good-extras \
    gstreamer1-plugins-ugly \
    gstreamer1-plugins-bad-free \
    gstreamer1-plugins-good \
    gstreamer1-plugins-base \
    gstreamer1 \
    x264

echo "Installing basic software"
sudo dnf install -y \
    neofetch \
    code \
    neovim \
    chrome-gnome-shell \
    gnome-tweak-tool

echo "Installing basic flatpak"
flatpak install -y flathub \
    com.spotify.Client \
    com.valvesoftware.Steam \
    com.slack.Slack

echo "Installing extensions"
firefox \
    https://extensions.gnome.org/extension/517/caffeine/ \
    https://extensions.gnome.org/extension/1253/extended-gestures/ \
    https://extensions.gnome.org/extension/1125/github-notifications/ \
    https://extensions.gnome.org/extension/1319/gsconnect/ \
    https://extensions.gnome.org/extension/118/no-topleft-hot-corner/ \
    https://extensions.gnome.org/extension/600/launch-new-instance/ \
    https://extensions.gnome.org/extension/15/alternatetab/ \
    https://extensions.gnome.org/extension/1112/screenshot-tool/ \
    https://extensions.gnome.org/extension/355/status-area-horizontal-spacing/ \
    https://extensions.gnome.org/extension/1031/topicons/ \
    https://extensions.gnome.org/extension/843/bumblebee-indicator/