#!/bin/bash
#

SITE_TITLE="{$LANDO_APP_NAME}"
WP_TYPE="single"

# DO NOT EDIT BELOW THIS LINE.

if [ -f "$PWD/public/core/wp-load.php" ]; then
	echo "WordPress is already installed."
	exit
fi

echo "Downloading WordPress and dependencies..."
composer install

echo "Setting up .env file..."
cp -f "$PWD/config/.env.tmpl" "$PWD/.env"

if [ "${WP_TYPE}" = "subdomain" ]; then
	INSTALL_COMMAND="multisite-install --subdomains"
elif [ "${WP_TYPE}" = "subdirectory" ]; then
	INSTALL_COMMAND="multisite-install"
else
	INSTALL_COMMAND="install"
fi

HOME_URL="https://{$LANDO_APP_NAME}.{$LANDO_DOMAIN}"

echo "Installing WordPress..."
wp core ${INSTALL_COMMAND} --url="$HOME_URL" --title="$SITE_TITLE" --admin_name=admin --admin_email="admin@local.test" --admin_password="password"

if [ "${WP_TYPE}" = "subdomain" ]; then
	sed -i "s#MULTISITE=false#MULTISITE=true#" "$PWD/.env"
elif [ "${WP_TYPE}" = "subdirectory" ]; then
	sed -i "s#MULTISITE=false#MULTISITE=true#" "$PWD/.env"
	sed -i "s#SUBDOMAIN_INSTALL=true#SUBDOMAIN_INSTALL=false#" "$PWD/.env"
fi

echo "Done."
