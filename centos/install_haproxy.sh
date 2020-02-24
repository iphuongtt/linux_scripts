# check latest version of HAProxy at http://www.haproxy.org/

sudo yum install gcc pcre-devel tar make -y 

curl http://www.haproxy.org/download/2.1/src/haproxy-2.1.0.tar.gz > haproxy-2.1.0.tar.gz  

tar xf haproxy-2.1.0.tar.gz  

cd ~/haproxy-*

sudo make TARGET=linux-glibc USE_NS=1 USE_TFO=1 USE_OPENSSL=1 USE_ZLIB=1 USE_PCRE=1 && sudo make install
sudo mkdir -p /etc/haproxy
sudo mkdir -p /var/lib/haproxy 
sudo touch /var/lib/haproxy/stats
 
sudo ln -s /usr/local/sbin/haproxy /usr/sbin/haproxy
 
sudo cp ~/haproxy-*/examples/haproxy.init /etc/init.d/haproxy
sudo chmod 755 /etc/init.d/haproxy
sudo systemctl daemon-reload
 
sudo chkconfig haproxy on
 
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload

sudo groupadd -g 188 haproxy  
sudo useradd -g 188 -u 188 -d /var/lib/haproxy -s /sbin/nologin -c haproxy haproxy
 
sudo cat <<EOF >> /etc/haproxy/haproxy.cfg
global
   log /dev/log local0
   log /dev/log local1 notice
   chroot /var/lib/haproxy
   stats timeout 30s
   user haproxy
   group haproxy
   daemon

defaults
   log global
   mode http
   option httplog
   option dontlognull
   timeout connect 5000
   timeout client 50000
   timeout server 50000

frontend  fe_web
    bind *:80
    mode tcp
    use_backend stat if { path -i /my-stats }
    default_backend stat

frontend ihoadon-v3
   bind *:443 ssl crt /etc/haproxy/ssl/_.erp.efy.com.vn.pem
   mode http
   default_backend http_back

backend http_back
   mode http
   balance roundrobin
   option forwardfor
   option httpchk HEAD / HTTP/1.1\r\nHost:localhost
   server sr242 192.168.1.242:443 check
   server sr250 192.168.1.250:443 check
   http-request set-header X-Forwarded-Port %[dst_port]

backend stat
    stats enable
    stats uri /my-stats
    stats refresh 15s
    stats show-legends
    stats show-node
EOF

sudo systemctl enable haproxy
sudo sudo systemctl start haproxy