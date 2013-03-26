#Nginx installation
nginx=stable
add-apt-repository -y ppa:nginx/$nginx
apt-get update 
apt-get install -y nginx

