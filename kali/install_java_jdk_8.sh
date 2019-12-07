#Create repositories file for Java
sudo touch /etc/apt/sources.list.d/java.list
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main" | sudo tee -a /etc/apt/sources.list.d/java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main" | sudo tee -a /etc/apt/sources.list.d/java.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

sudo apt-get update

java -version

sudo apt install openjdk-8-jdk