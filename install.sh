#!/usr/bin/env bash

username="hansen"

declare -a core_packages=(
    "xdg-desktop-portal"
    "xdg-desktop-portal-gnome"
    "polkit"
    "polkit-gnome"
    "gnome-keyring"
    "niri"
    "swayosd"
    "swaync"
    "papirus-icon-theme"
    "adw-gtk-theme"
    "network-manager-applet"
    "neovim"
    "tree-sitter-cli"
    "alacritty"
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

declare -a user_packages=(
    "android-tools"
    "ddcutil"
    "lorem"
    "evince"
    "filelight"
    "guvcview"
    "gnome-calculator"
    "lua"
    "nodejs"
    "gucview"
    "obs-studio"
    "mpv"
    "mpv-mpris"
    "yt-dlp"
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
    "azure-cli"
    "cloudflare-warp-bin"
    "cmake"
    "make"
    "dbeaver"
    "drawio-desktop"
    "pear-desktop"
    "shfmt"
)

declare -a user_packages_aur=(
    "ttf-ms-fonts"
    "spotify"
    "hoppscotch-bin"
    "visual-studio-code-bin"
    "postman-bin"
    "onlyoffice-bin"
)

declare -a groups=("docker" "wireshark" "libvirt" "kvm")

declare -a user_services=("warp-taskbar")
declare -a system_services=("ly@tty1" "docker" "warp-svc")

function install_core_packages() {
    sudo pacman -S --needed --noconfirm "${core_packages[@]}"
}

function install_user_packages() {
    sudo pacman -S --needed --noconfirm "${user_packages[@]}"
}

function install_aur_packages() {
    paru -S --needed --skipreview "${user_packages_aur[@]}"
}

function add_groups() {
    for group in "${groups[@]}"; do
        sudo usermod -aG "$username" "$group"
    done
}

function enable_user_services() {
    for user_service in "${user_services[@]}"; do
        systemctl --user enable --now "$user_service"
    done
}

function enable_system_services() {
    for system_service in "${system_services[@]}"; do
        sudo systemctl enable --now "$system_service"
    done
}

function additional_setup() {
    powerprofilesctl set performance
}

function sync_dotfiles() {
    #TODO: Stow dotfiles

}

function apply_theme() {
    gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
    gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
}


function install_homebrew() {
    #TODO: Install homebrew

}

install_core_packages()
install_user_packages()
install_aur_packages()
enable_system_services()
enable_user_services()
additional_setup()
sync_dotfiles()
apply_theme()
install_homebrew()
