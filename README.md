grunt-init-craft
================

This is a grunt init template for Craft projects. It automates the following:

* Downloads and installs Craft as a dependency
* Compiles SASS and Blesses it
* Concatenates and minifies all vendor JS
* Minifies main.js
* Compiles a gitbook in `docs/`
* Watches for changes and recompiles
* Makes automatic backups of the SQL database to `data/cms.sql`
* Automatically imports `data/cms.sql` when the Vagrant server starts

Installation
------------
If you haven't already done so, install [grunt-init](http://gruntjs.com/project-scaffolding).

Once grunt-init is installed, place this template in your ~/.grunt-init/ directory. It's recommended that you use git to clone this template into that directory, as follows:

	git clone git@github.com:Pennebaker/grunt-init-craft.git ~/.grunt-init/craft

Usage
-----
At the command-line, `cd` into an empty directory, run this command and follow the prompts.

	grunt-init craft

_Note that this template will generate files in the current directory, so be sure to change to a new directory first if you don't want to overwrite existing files._

Next run `npm install`. Then run `vagrant up` to start the server, and `grunt` to start the watcher.
