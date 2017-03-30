#!/bin/bash
cp /etc/kde4/kdm/kdmrc /root/kdmrc.bck
cp /etc/init.d/kdm /root/kdm.bck
sed 's|#GUIStyle=Plastique|GUIStyle=Oxygen|' -i /etc/kde4/kdm/kdmrc
sed 's|#ColorScheme=MidnightMeadow|ColorScheme=Oxygen|' -i /etc/kde4/kdm/kdmrc
sed 's/#PreselectUser=Previous/PreselectUser=None/' -i /etc/kde4/kdm/kdmrc
sed 's/PreselectUser=Previous/PreselectUser=None/' -i /etc/kde4/kdm/kdmrc
sed 's|Theme=@@@ToBeReplacedByDesktopBase@@@|Theme=/usr/share/kde4/apps/kdm/themes/iut|' -i /etc/kde4/kdm/kdmrc
sed 's|elarun|iut|' -i /etc/init.d/kdm
wget https://raw.githubusercontent.com/stefviv/KDE/master/KDE/4.14.2/Theme.tar
tar xf Theme.tar --directory /
update-rc.d kdm defaults
reboot
