#!/usr/bin/env bash

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d ${fonts_dir} ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p ${fonts_dir}
else
    echo "Found fonts dir $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    if [ ! -e ${file_path} ]; then
        echo "wget -O $file_path $file_url"
        wget -O ${file_path} ${file_url}
    else
	echo "Found existing file $file_path"
    fi;
done

echo mkdir -p ~/.config/fontconfig
mkdir -p ~/.config/fontconfig

[ ! -e ~/.config/fontconfig/fonts.conf ] & echo cat $HOME/dotfiles/fonts.conf \> ~/.config/fontconfig/fonts.conf && cat $HOME/dotfiles/fonts.conf > ~/.config/fontconfig/fonts.conf

echo "fc-cache -f"
fc-cache -f
