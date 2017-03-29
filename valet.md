# Laravel Valet

## Install Dependencies

```bash
brew update
brew upgrade
brew install homebrew/php/composer
brew install libpng libxml2 cmake mcrypt dnsmasq
brew install mariadb
brew install homebrew/php/php70 php70-mcrypt
brew services stop mariadb
mysql_install_db --basedir="$(brew --prefix mariadb)" --datadir=/usr/local/var/mysql --defaults-file=/usr/local/etc
brew services start mariadb
```

Upgrade php70 memory limit.

```bash
vim /usr/local/etc/php/7.0/php-fpm.d/www.conf
```
Add this to the bottom of the file
```
php_admin_value[memory_limit] = 256M
```
Last restart the php70 brew service
```bash
sudo brew services restart php70
```

`~/.composer/vendor/bin` Should be in the path. If not add
```
export PATH="$PATH:$HOME/.composer/vendor/bin"
```
to `~/.zshrc` or `~/.bashrc`

`source ~/.zshrc` or `source ~/.bashrc`

## Install

```bash
composer global require laravel/valet
valet install
```

## Upgrading To Valet 2.0

Valet 2.0 transitions Valet's underlying web server from Caddy to Nginx. Before upgrading to this version you should run the following commands to stop and uninstall the existing Caddy daemon:

```bash
valet stop
valet uninstall
```

Next, you should upgrade to the latest version of Valet. Depending on how you installed Valet, this is typically done through Git or Composer. If you installed Valet via Composer, you should use the following command to update to the latest major version:

`composer global require laravel/valet`

Once the fresh Valet source code has been downloaded, you should run the install command:

```bash
valet install
valet restart
```

After upgrading, it may be necessary to re-park or re-link your sites.

## Valet Linking

In the terminal navigate to the `dist` folder and enter `valet link example`

This will then link http://example.dev to this dist folder.

You can enable ssl with `valet secure example`. You can disable ssl with `valet unsecure example`.

## Unable to Reach Host

Try running

```bash
sudo brew services start --all
```
