#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo usermod -a -G audio vagrant
sudo apt-get install -y alsa alsa-utils pulseaudio espeak

amixer sset Master unmute
amixer sset Master 100%
amixer sset PCM unmute
amixer sset PCM 100%

espeak "Hello World"
