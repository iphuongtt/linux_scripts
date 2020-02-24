#Download Php storm for linux at https://www.jetbrains.com/phpstorm/download/#section=linux (.gz)
tar -xvf PhpStorm* && cd PhpStorm*
sudo mkdir -p /usr/local/phpstorm
sudo mv -n * /usr/local/phpstorm
#Create shortcut file to desktop
echo "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=Php storm
GenericName=Php storm
Comment=Php storm
Path=/usr/local/phpstorm/
Exec=/usr/local/phpstorm/bin/phpstorm.sh
Icon=/usr/local/phpstorm/bin/phpstorm.png
Categories=IDE;Development
WM_CLASS=Phpstorm
StartupWMClass=Phpstorm
StartupNotify=true
Keywords=SQL;IDE;PHP;
MimeType=application/application" | sudo tee /usr/share/applications/phpstorm.desktop