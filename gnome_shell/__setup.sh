#!/bin/bash

trap "exit 1" ERR

set -x

dconf write /org/gnome/shell/overrides/dynamic-workspaces false
dconf write /org/gnome/shell/app-switcher/current-workspace-only true
dconf write /org/gnome/shell/window-switcher/current-workspace-only true

# Switch workspaces using Alt-Fn
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-1 "['<Alt>F1']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-2 "['<Alt>F2']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-3 "['<Alt>F3']"
dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-4 "['<Alt>F4']"

# Move windows to workspaces using Ctrl-Fn
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-1 "['<Primary>F1']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-2 "['<Primary>F2']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-3 "['<Primary>F3']"
dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-4 "['<Primary>F4']"

# Assign Alt-Fn and Ctrl-Fn shortcuts to something else
dconf write /org/gnome/desktop/wm/keybindings/panel-run-dialog "['<Super>F2']"
dconf write /org/gnome/desktop/wm/keybindings/panel-main-menu "['<Super>F1']"
dconf write /org/gnome/desktop/wm/keybindings/close "['<Super>F4']"


# Install gnome-shell extensions
sudo apt-get -y install jq

installExtension() {
	extensionId="$1"
	gnomeShellVersion="$(gnome-shell --version)"
	gnomeShellVersion="${gnomeShellVersion##GNOME Shell }"


	extensionMetadata="$(curl -s "https://extensions.gnome.org/extension-info/?pk=$extensionId&shell_version=$gnomeShellVersion")"
	downloadUrl="$(echo $extensionMetadata | jq -r .download_url)"
	uuid="$(echo $extensionMetadata | jq -r .uuid)"

	dir=~/.local/share/gnome-shell/extensions/$uuid


	mkdir -p "$dir"
	wget -O "$dir/extension.zip" "https://extensions.gnome.org/$downloadUrl"
	unzip -f "$dir/extension.zip" -d "$dir"
	rm "$dir/extension.zip"

	# restart shell
	dbus-send --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'
}

installExtension 1031 # TopIcons

nohup gnome-shell --replace &


