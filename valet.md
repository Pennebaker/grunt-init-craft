# Laravel Valet

## Install Dependencies

```
brew update
brew upgrade
brew install homebrew/php/composer
brew install libpng libxml2 cmake mcrypt  dnsmasq
brew install mariadb
brew install homebrew/php/php70 php70-mcrypt
mysql_install_db --basedir="$(brew --prefix mariadb)" --datadir=/usr/local/var/mysql --defaults-file=/usr/local/etc
brew services start mariadb
```

`~/.composer/vendor/bin` Should be in the path. If not add
```
export PATH="$PATH:$HOME/.composer/vendor/bin"
```
to `~/.zshrc` or `~/.bashrc`

`source ~/.zshrc` or `source ~/.bashrc`

## Install

```
composer global require laravel/valet
valet install
```

## Enable Compression

```
vim ~/.valet/Caddyfile
```

Add `gzip` under `:80 {` to compress the webpages.

## Valet Linking

In the terminal navigate to the `dist` folder and enter `valet link example`

This will then link http://example.dev to this dist folder.

You can enable ssl with `valet secure example`. You can disable ssl with `valet unsecure example`.
