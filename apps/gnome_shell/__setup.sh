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


