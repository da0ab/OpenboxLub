#!/bin/bash

 if wget https://github.com/da0ab/OpenboxLub/archive/refs/heads/master.zip
 
then
   tar xfz *.zip
else
    echo ERROR
    exit 1
fi


sudo apt-get update

#lubuntu
sudo apt-get install gmrun xxkb tint2 xfonts-terminus-oblique mc vim-gtk moc gimp inkscape filezilla keepassx unrar p7zip

sudo chmod +s /sbin/halt
sudo chmod +x -R ~/bin/
sudo chmod +x -R ~/.config/openbox
mkdir screen
mkdir tmp
#ln -s ~/Copy/backup/fonts ~/.fonts
rm -r /user/share/gimp/2.0/brushes


