URLHHVM="http://hhvmwordpressbenchmarks"
URLOLDPHP="http://oldphpwordpressbenchmarks"
NEWOLDPHP="http://newphpwordpressbenchmarks"
FULL_PATH="/var/www/benchmarksphp7hhvm/wordpress"
WP="./wp-cli.phar"

$WP core download --path=$FULL_PATH
$WP core config --path=$FULL_PATH --dbname=wordpressbenchmarks --dbuser=wordpressbenchmarks
mysql -e "CREATE DATABASE wordpressbenchmarks"
$WP core install --path=$FULL_PATH --url=$URLHHVM --title=wordpressbenchmarks --admin_user=admin --admin_password=admin --admin_email=ilikebenchmarks@randomdomain.com

#$WP search-replace '$NEWOLDPHP' '$URLHHVM' --skip-columns=guid --path=$FULL_PATH

mysql -e "CREATE DATABASE magento"

mysql -e "UPDATE core_config_data SET VALUE = 'http://oldphpmagentobenchmarks/' WHERE path = 'web/unsecure/base_url';" magento
mysql -e "UPDATE core_config_data SET VALUE = 'http://oldphpmagentobenchmarks/' WHERE path = 'web/secure/base_url';" magento

# mysql -e "UPDATE core_config_data SET VALUE = 'http://hhvmmagentobenchmarks/' WHERE path = 'web/unsecure/base_url';" magento
# mysql -e "UPDATE core_config_data SET VALUE = 'http://hhvmmagentobenchmarks/' WHERE path = 'web/secure/base_url';" magento