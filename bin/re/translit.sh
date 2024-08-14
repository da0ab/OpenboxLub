#!/bin/sh
# this script has been written by Eddy
#
#               rename_translit --- переводит русские имена файлов в транслит
#
# Создан 22-го Май 2006 года в  9:24
#
# доковырян Втр 17 Авг 2010 16:47:14
#
#
#
#

for Name in *
do
    echo $Name ----
    Newname=`echo "$Name"|sed \
    -e "y/йукенгзхфывапролдэсмитбЙУКЕНГЗХФЫВАПРОЛДЭСМИТБ/jukengzhfyvaproldesmitbJUKENGZHFYVAPROLDESMITB/"\
    -e "s/ц/tz/g"       \
    -e "s/ш/sh/g"       \
    -e "s/щ/sch/g"      \
    -e "s/ж/zh/g"       \
    -e "s/ч/ch/g"       \
    -e "s/ю/yu/g"       \
    -e "s/я/ya/g"       \
    -e "s/Ц/TZ/g"       \
    -e "s/Ш/SH/g"       \
    -e "s/Щ/SCH/g"      \
    -e "s/Ж/ZH/g"       \
    -e "s/Ч/CH/g"       \
    -e "s/Ю/YU/g"       \
    -e "s/Я/YA/g"       \
    -e "s/ъ//g"         \
    -e "s/ь//g"         \
    -e "s/Ъ//g"         \
    -e "s/%//g"         \
    -e "s/!//g"         \
    -e "s/#//g"         \
    -e "s/№//g"         \
    -e "s/*//g"         \
    -e "s/&//g"         \
    -e "s/,//g"         \
    -e "s/@//g"         \
    -e "s/+//g"         \
    -e "s/=//g"         \
    -e "s/-//g"         \
    -e "s/~//g"         \
    -e "s/)//g"         \
    -e "s/(//g"         \
    -e "s/;//g"         \
    -e "s/://g"         \


    -e "s/Ь//g"`
    echo $Name - $Newname
    if [ "$Name" != "$Newname" ]; then
        mv "$Name" "$Newname"
        echo -e "$Name   ->    $Newname\r\c"
    fi
    if [ -d "$Newname" ]; then
        cd "$Newname"
        echo -e "\n\nDiving into $Newname"
        rename_translit
        cd ../
    fi
done
