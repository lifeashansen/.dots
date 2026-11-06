#!/usr/bin/env bash

username="hansen"

declare -a CORE_PACKAGES=(
    "xdg-desktop-portal"
    "xdg-desktop-portal-gnome"
    "niri"
    "polkit"
    "polkit-gnome"
    "swayosd"
    "swaync"
    "papirus-icon-theme"
    "adw-gtk-theme"
    "network-manager-applet"
    "neovim"
    "tree-sitter-cli"
    "alacritty"
    "gnome-keyring"
    "bat"
    "tmux"
    "zsh"
    "htop"
    "direnv"
    "zoxide"
    "easyeffects"
    "kvantum"
    "fzf"
    "github-cli"
    "blueman"
    "ripgrep"
    "gvfs"
    "gvfs-mtp"
    "kdeconnect"
    "sshfs"
    "zip"
    "unzip"
    "jq"
    "stow"
    "ly"
    "man-db"
    "man-pages"
    "thunar"
    "net-tools"
    "paru"
    "pavucontrol"
    "power-profiles-daemon"
    "swaybg"
    "swaylock"
    "swayidle"
    "hyprpicker"
    "ttf-iosevka-nerd"
    "waybar"
    "wlsunset"
    "wl-clipboard"
    "cliphist"
    "fuzzel"
    "xwayland-satellite"
)

declare -a USER_PACKAGES=(
    "evince"
    "filelight"
    "guvcview"
    "gnome-calculator"
    "lua"
    "nodejs"
    "gucview"
    "obs-studio"
    "mpv"
    "vlc"
    "yt-dlp"
    "zeal"
    "zed"
    "wireshark-qt"
    "typescript"
    "tldr"
    "telegram-desktop"
    "vesktop-bin"
    "uv"
    "qemu-full"
    "virt-manager"
    "sqlc"
    "postgresql"
    "pnpm"
    "npm"
    "mpv-mpris"
    "lazygit"
    "gimp"
    "freedownloadmanager"
    "docker"
    "docker-compose"
    "docker-buildx"
    "minikube"
    "helm"
    "kubectl"
    "ansible"
    "terraform"
    "go"
    "gopls"
    "rustup"
    "aws-cli-v2"
    "cloudflare-warp-bin"
    "cmake"
    "make"
    "dbeaver"
    "drawio-desktop"
    "pear-desktop"
    "shfmt"
)

declare -a USER_PACKAGES_AUR=(
    "ttf-ms-fonts"
    "spotify"
    "hoppscotch-bin"
    "visual-studio-code-bin"
    "postman-bin"
    "onlyoffice-bin"
)

declare -a GROUPS=("docker" "wireshark" "libvirt" "kvm")

declare -a USER_SERVICES=("warp-taskbar")
declare -a SYSTEM_SERVICES=("ly@tty1" "docker" "warp-svc")

function install_core_packages() {
    sudo pacman -S --needed --noconfirm "${CORE_PACKAGES[@]}"
}

function install_user_packages() {
    sudo pacman -S --needed --noconfirm "${USER_PACKAGES[@]}"
}

function install_aur_packages() {
    paru -S --needed "${USER_PACKAGES_AUR[@]}"
}

function add_groups() {
    for group in "${GROUPS[@]}"; do
        sudo -aG "$username" "$group"
    done
}

function enable_user_services() {
    for user_service in "${USER_SERVICES[@]}"; do
        systemctl --user enable --now "$user_service"
    done
}

function enable_system_services() {
    for system_service in "${SYSTEM_SERVICES[@]}"; do
        sudo systemctl enable --now "$system_service"
    done

}

function apply_theme() {
    gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
    gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
}

install_core_packages()
install_user_packages()
install_aur_packages()
enable_system_services()
enable_user_services()
apply_theme()
