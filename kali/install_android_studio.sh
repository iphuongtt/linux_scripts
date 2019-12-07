sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
#Download android studio for linux at https://developer.android.com/studio#downloads (.gz)
tar -xvf android-studio* && cd android-studio
sudo mkdir /usr/local/android-studio
sudo mv * /usr/local/android-studio
#Create shortcut file to desktop
sudo gedit /usr/share/applications/android-studio.desktop
# copy and pasted this text
#######################################################################
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=Android Studio
GenericName=Android Studio
Comment=Android Studio
Path=/usr/local/android-studio/
Exec=/usr/local/android-studio/bin/studio.sh
Icon=/usr/local/android-studio/bin/studio.png
Categories=IDE;Development
WM_CLASS=AndroidStudio
StartupWMClass=AndroidStudio
StartupNotify=true
Keywords=SQL;IDE;Android;
MimeType=application/application
#######################################################################

