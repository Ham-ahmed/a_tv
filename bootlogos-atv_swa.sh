#!/bin/sh
echo ''
echo '************************************************************'
echo "**                         STARTED                        **"
echo '************************************************************'
echo ''
sleep 3s
if [ -d /usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper ]; then
echo "> removing package please wait..."
sleep 3s 
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper

echo "*******************************************"
echo "*             Removed Finished            *"
echo "*            Uploaded By H-Ahmed          *"
echo "*******************************************"
sleep 3s

else

#download install plugin
if [ ! -d '/usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper' ]; then
wget -O /var/volatile/tmp/$package.tar.gz --no-check-certificate https://raw.githubusercontent.com/Ham-ahmed/a_tv/refs/heads/main/open-atv_swa.tar.gz
tar -xzf /tmp/$package.tar.gz -C /
rm -rf /tmp/$package.tar.gz >/dev/null 2>&1
fi
######################################


#remove unnecessary files and folders
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL >/dev/null 2>&1
fi
rm -rf /control >/dev/null 2>&1
rm -rf /postinst >/dev/null 2>&1
rm -rf /preinst >/dev/null 2>&1
rm -rf /prerm >/dev/null 2>&1
rm -rf /postrm >/dev/null 2>&1
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1
#remove bootlogos
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper/bootlogos/*.mvi >/dev/null 2>&1

#config
plugin=bootlogos-mixed-atv
version=mixed
url=https://raw.githubusercontent.com/Ham-ahmed/a_tv/refs/heads/main/open-atv_swa.tar.gz
package=/var/volatile/tmp/$plugin-$version.tar.gz

#download & install
echo "> Downloading $plugin-$version package  please wait ..."
sleep 3s

wget -O $package --no-check-certificate $url
tar -xzf $package -C /
extract=$?
rm -rf $package >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then
echo "> $plugin-$version package installed successfully"
echo "> Uploaded By Haitham"
sleep 3s

else

echo "> $plugin-$version package installation failed"
sleep 3s
fi

fi

echo "**********************************************************
echo "#                   INSTALLED SUCCESSFULLY              #"
echo "*                       ON - Panel                      *"
echo "*                Enigma2 restart is required            *"
echo "*********************************************************"
echo "               UPLOADED BY  >>>>   HAMDY_AHMED           "
sleep 4;
	echo "====================================================="
############################################                                                                                                                  
echo ". >>>>         RESTARING         <<<<"
echo "*********************************************************"
wait
killall -9 enigma2
exit 0
exit 0
