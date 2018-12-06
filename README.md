[![Latest Stable Version](https://poser.pugx.org/felixarntz/wp-composer-stack/version)](https://packagist.org/packages/felixarntz/wp-composer-stack)
[![License](https://poser.pugx.org/felixarntz/wp-composer-stack/license)](https://packagist.org/packages/felixarntz/wp-composer-stack)

# WP Composer Stack

A modern WordPress stack with Composer.

## Setup

* Make sure you have all requirements installed.
* Create a new empty directory and navigate to it.
* Run `git init`.
* Run `git remote add upstream git@github.com:felixarntz/wp-composer-stack.git`.
* Run `git fetch upstream`.
* Run `git merge upstream/master`.
* Open `.lando.yml` and replace `wpcomposerstack` with a name of your preference. Your site will be available via `{$NAME}.lndo.site`.
* Optionally, open `config/wp-install.sh` and adjust the config variables at the top of the file.
* Optionally, open `composer.json` and add dependencies you'd like to use.
* Run `lando start`.
* Run `lando wp-install`.
* Access your site via `{$NAME}.lndo.site`.
* At this point, it's probably good to connect your project's git repository and do a first commit. :)

## Requirements

* Install Lando: `brew cask install lando`
* Trust the Lando SSL certificate: `sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.lando/certs/lndo.site.pem`
