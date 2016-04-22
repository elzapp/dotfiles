#!/bin/bash

TMP=$(mktemp -d /tmp/i3setup.XXXXXXX)

INSTALLER="echo"
if which dnf
then
INSTALLER="dnf"

elif which apt-get
then
INSTALLER="apt-get"

fi

$INSTALLER install i3 feh lxappearance git

cp 

pushd $TMP
git clone git@github.com:supermarin/YosemiteSanFranciscoFont.git fontsf
cp fontsf/*.ttf ~/.local/share/fonts/

wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip -O code.zip
unzip code.zip
cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf ~/.local/share/fonts/

wget https://github.com/adobe-fonts/source-sans-pro/archive/2.020R-ro/1.075R-it.zip -O sans.zip
unzip sans.zip
cp source-sans-pro-2.020R-ro-1.075R-it/OTF/*.otf ~/.local/share/fonts/

popd

#update font cache
fc-cache 
