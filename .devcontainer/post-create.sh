#!/bin/bash
set -e

# Install essential packages
apt-get update && apt-get install -y \
    git \
    wget \
    curl \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    libstdc++-12-dev \
    android-sdk

# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable /opt/flutter
export PATH="$PATH:/opt/flutter/bin"

# Add Flutter to PATH permanently
echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc
echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.zshrc

# Precache Flutter dependencies
flutter precache

# Install Flutter dependencies
flutter doctor

# Accept Android licenses
yes | flutter doctor --android-licenses

# Get project dependencies
cd /workspaces/ente/mobile
flutter pub get