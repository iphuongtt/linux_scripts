#Download XAMPP for linux at https://www.apachefriends.org/index.html

$ cd /home/[username]/Downloads
$ chmod 755 [package name]

chmod 755 xampp-linux-x64-7.2.10-0-installer.run
ls -l xampp-linux-x64-7.2.10-0-installer.run

sudo ./xampp-linux-7.2.10-0-installer.run

# Lauch
sudo /opt/lampp/lampp start

# Make desktop shortcut
#Create shortcut file to desktop

sudo chmod 777 manager-linux-x64.run

echo "[Desktop Entry]
Comment=Start and Stop XAMPP
Name=XAMPP Control Panel
Exec=sudo /opt/lampp/manager-linux-x64.run
Icon=/opt/lampp/htdocs/favicon.ico
Encoding=UTF-8
Terminal=true
Name=XAMPP Control Panel
Comment=Start and Stop XAMPP
Type=Application" | sudo tee /usr/share/applications/xampp-control-panel.desktop
