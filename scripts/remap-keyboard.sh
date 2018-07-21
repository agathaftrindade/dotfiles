#/bin/env sh
localectl set-x11-keymap "au,us" "" ",intl" "ctrl:nocaps,grp:menu_toggle"

## Written by systemd-localed(8), read by systemd-localed and Xorg. It's
# probably wise not to edit this file manually. Use localectl(1) to
# instruct systemd-localed to update it.

#ABNT
#Section "InputClass"
#    Identifier "system-keyboard"
#     MatchIsKeyboard "on"
#     Option "XkbLayout" "br"
#     Option "XkbVariant" "abnt2"
#     Option "XkbOptions" "ctrl:nocaps"
#EndSection
