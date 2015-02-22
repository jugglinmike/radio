#!/usr/bin/env bash

set -e

PROJECT_DIR=/vagrant
USER=radio

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y alsa alsa-utils pulseaudio espeak mpd mpc

useradd -d /home/$USER -m $USER
sudo usermod -a -G audio $USER

amixer sset Master unmute
amixer sset Master 100%
amixer sset "Master Mono" unmute
amixer sset "Master Mono" 100%
amixer sset PCM unmute
amixer sset PCM 100%

echo "Configuring Music Player Daemon"
sed "s/{{\s*USER\s*}}/$USER/g" $PROJECT_DIR/src/system/mpd.conf > /etc/mpd.conf
mkdir -p /home/$USER/music
chown $USER /home/$USER/music
chown -R $USER /var/run/mpd
service mpd restart

su $USER
espeak "Hello World"
