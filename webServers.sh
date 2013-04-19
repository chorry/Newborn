#Nginx installation
nginx=stable
add-apt-repository -y ppa:nginx/$nginx
apt-get update 
apt-get install -y nginx

#Php and  Apache 2
apt-get install -y php5 php5-common php5-curl php-pear php5-dev php5-mysql php5-sqlite php-apc libapache2-mod-rpaf libapache2-mod-php5 php5-suhosin php5-gd php5-fpm php5-cgi php5-mcrypt
sed -e 's/80/8000/' /etc/apache2/ports.conf > /etc/apache2/ports.conf.tmp && mv  /etc/apache2/ports.conf.tmp /etc/apache2/ports.conf
sed -e 's/Listen 8000/Listen 127.0.0.1:8000/' /etc/apache2/ports.conf > /etc/apache2/ports.conf.tmp && mv  /etc/apache2/ports.conf.tmp /etc/apache2/ports.conf

#copy and link configs
mkdir /var/www/autohost/
cp apache2-configs/autoHost.loc /etc/apache2/sites-available/
cp nginx-configs/apacheProxy.loc /etc/nginx/sites-available/
cp -r nginx-configs/includes /etc/nginx/
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/apacheProxy.loc /etc/nginx/sites-enabled/apacheProxy.loc

#enable stuff
a2enmod vhost_alias
a2dissite default
a2ensite autoHost.loc


#nginx stuff
mkdir /var/log/nginx/example-master1/
mkdir /var/log/nginx/example-master2/
mkdir /var/log/nginx/example-slave1/
mkdir /var/log/nginx/example-slave2/

mkdir /var/www/nginx-proxy-cache
mkdir /var/www/nginx-fastcgi-cache
mkdir /var/www/nginx-proxy-cache/common-cache-s1
mkdir /var/www/nginx-proxy-cache/common-cache-s2
mkdir /var/www/nginx-proxy-cache/example.dev-s1
mkdir /var/www/nginx-proxy-cache/example.dev-s2
mkdir /var/www/nginx-proxy-cache/temp-s1
mkdir /var/www/nginx-proxy-cache/temp-s2
mkdir /var/www/nginx-fastcgi-cache
mkdir /var/www/nginx-fastcgi-cache/example.dev-s1
mkdir /var/www/nginx-fastcgi-cache/temp-s1
mkdir /var/www/nginx-fastcgi-cache/temp-s2

#fpm stuff
sed -e 's/listen = \/var\/run\/php5-fpm.sock/\;listen = \/var\/run\/php5-fpm.sock\nlisten=127.0.0.1:9000/' /etc/php5/fpm/pool.d/www.conf > /etc/php5/fpm/pool.d/www.conf.bak && mv /etc/php5/fpm/pool.d/www.conf.bak /etc/php5/fpm/pool.d/www.conf
service php5-fpm restart
