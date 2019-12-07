sudo yum search mariadb

sudo yum info mariadb

sudo yum install mariadb-server
sudo systemctl enable mariadb.service
sudo systemctl start mariadb.service
sudo mysql_secure_installation