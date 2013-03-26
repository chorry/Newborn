#Nginx installation
nginx=stable
add-apt-repository -y ppa:nginx/$nginx
apt-get update 
apt-get install -y nginx

#Php and  Apache 2
apt-get install -y php5 php5-common php5-curl php-pear php5-dev php5-mysql php5-sqlite php-apc libapache2-mod-rpaf
sed -e 's/80/8000/' /etc/apache2/ports.conf > /etc/apache2/ports.conf.tmp && mv  /etc/apache2/ports.conf.tmp /etc/apache2/ports.conf
sed -e 's/Listen 8000/Listen 127.0.0.1:8000/' /etc/apache2/ports.conf > /etc/apache2/ports.conf.tmp && mv  /etc/apache2/ports.conf.tmp /etc/apache2/ports.conf

mkdir /var/www/autohost/
cp autoHost.loc /etc/apache2/sites-available/

cp apacheProxy.loc /etc/nginx/sites-available/
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/apacheProxy.loc /etc/nginx/sites-enabled/apacheProxy.loc

#enable stuff
a2enmod vhost_alias
a2dissite default
a2ensite autoHost.loc

