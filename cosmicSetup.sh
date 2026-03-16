#!/bin/bash -i

if ! dnf list --install "cosmic-desktop" >/dev/null 2>&1; then
    sudo dnf install group cosmic-desktop -y
fi
