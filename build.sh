#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos


# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# 

dnf5 -y copr enable ublue-os/staging
dnf5 install -y kitty devpod fastfetch zsh
dnf5 -y copr disable ublue-os/staging

# Install Sublime HQ GPG key to facilitate install of Sublime Text, Sublime Merge.
# Enable Sublime Text and Sublime Merge repo, but do not install either by default.
wget https://download.sublimetext.com/sublimehq-rpm-pub.gpg -O /etc/pki/rpm-gpg
dnf5 -y config-manager addrepo --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

#### Example for enabling a System Unit File

systemctl enable podman.socket
