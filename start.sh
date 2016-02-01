#!/bin/bash

 if wget https://github.com/da0ab/openboxing/blob/master/start.tar.gz?raw=true
then
   tar xfz *.tar.gz
else
    echo ERROR

    exit 1
fi


sudo apt-get update

#lubuntu
sudo apt-get install gmrun xxkb tint2 xfonts-terminus-oblique rxvt-unicode mc vim-gtk moc gimp inkscape filezilla keepassx gcolor2 gprename unrar p7zip

# dropbox copy .VirtualBox skype google-chrome


sudo chmod +s /sbin/halt
sudo chmod +x -R ~/bin/
sudo chmod +x -R ~/.config/openbox
mkdir screen
mkdir tmp
ln -s ~/Copy/backup/fonts ~/.fonts
rm -r /user/share/gimp/2.0/brushes


