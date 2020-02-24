sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
cd /tmp
sudo curl https://dl.google.com/dl/android/studio/ide-zips/3.5.3.0/android-studio-ide-191.6010548-linux.tar.gz > android-studio-ide-191.6010548-linux.tar.gz
#Download android studio for linux at https://developer.android.com/studio#downloads (.gz)
tar -xvf android-studio* && cd android-studio
sudo mkdir -p /usr/local/android-studio
sudo mv -n * /usr/local/android-studio
#Create shortcut file to desktop
echo "[Desktop Entry]
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
MimeType=application/application" | sudo tee /usr/share/applications/android-studio.desktop


export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
source $HOME/.bash_profile