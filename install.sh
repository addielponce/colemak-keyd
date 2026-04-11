#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/addielponce/colemak-keyd.git"
REPO_DIR="/tmp/colemak-keyd"
SOURCE_DIR="$REPO_DIR/keyd"
TARGET_DIR="/etc/keyd"
BACKUP_DIR="$HOME/keyd-backup-$(date +%Y%m%d-%H%M%S)"

sudo -v

for cmd in git keyd; do
	if ! command -v "$cmd" &>/dev/null; then
		echo "$cmd is not installed. Install it and try again."
		echo "  Ubuntu/Debian/Mint:       sudo apt install $cmd"
		echo "  Fedora:                   sudo dnf install $cmd"
		echo "  Arch:                     sudo pacman -Syu $cmd"
		exit 1
	fi
done

sudo rm -rf "$REPO_DIR"
git clone -q "$REPO_URL" "$REPO_DIR"

# Back up /etc/keyd if it already has content
if [[ -d "$TARGET_DIR" && "$(ls -A "$TARGET_DIR")" ]]; then
	echo "Existing content found in $TARGET_DIR! Creating backup at $BACKUP_DIR"
	mkdir -p "$BACKUP_DIR"
	cp -aZ "$TARGET_DIR" "$BACKUP_DIR/"
	echo "Backup saved to: $BACKUP_DIR"
else
	echo "No existing content in $TARGET_DIR. No backup is needed."
fi

# Copy config to /etc/keyd
echo "Copying keyd configs to $TARGET_DIR"
sudo mkdir -p "$TARGET_DIR"
sudo cp -aZ "$SOURCE_DIR/." "$TARGET_DIR/" && echo "Done! ✨❤️"

sudo keyd reload
