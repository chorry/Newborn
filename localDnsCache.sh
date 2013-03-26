#Setting up local dns cache
apt-get install dnsmasq
sed -e 's/#listen-address=/listen-address=127.0.0.1/' /etc/dnsmasq.conf > /etc/dnsmasq.conf.tmp && mv  /etc/dnsmasq.conf.tmp  /etc/dnsmasq.conf:w
echo 'prepend domain-name-servers 127.0.0.1;' >>/etc/dhcp3/dhclient.conf
echo 'request subnet-mask, broadcast-address, time-offset, routers,' >>/etc/dhcp3/dhclient.conf 
echo 'domain-name, domain-name-servers, host-name,' >>/etc/dhcp3/dhclient.conf
echo 'netbios-name-servers, netbios-scope;' >>/etc/dhcp3/dhclient.conf

echo 'nameserver 127.0.0.1' > /etc/resolv.conf.head
echo 'nameserver 80.68.246.10' >> /etc/resolv.conf.head
echo 'nameserver 80.68.246.100' >> /etc/resolv.conf.head

/etc/init.d/dnsmasq restart
