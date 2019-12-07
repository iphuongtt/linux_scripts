sudo yum install curl gcc openssl-devel libnl3-devel net-snmp-devel -y

curl --progress https://www.keepalived.org/software/keepalived-2.0.19.tar.gz | tar xz
cd keepalived*
./configure
make
sudo make install

sudo systemctl enable keepalived

cd ..
rm -rf keepalived*