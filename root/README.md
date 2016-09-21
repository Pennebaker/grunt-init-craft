# {%= name %}
---
### Currently running craft version 2.6 (2931)

### Prerequisites:

* Ensure your ssh public key has been added to your repo account for bitbucket and github.  
* Ensure you have the latest stable version of node.js installed.  
* Ensure you have [Valet](https://github.com/Pennebaker/grunt-init-craft/blob/master/valet.md) is installed  

### In terminal run:

1. `npm install`  
1. `cd dist && valet link example && cd ..`  
1. `addSubmodules.sh --force` to install submodules. If you want to cherry pick specific submodules, run the command without `--force`  
1. `grunt`  
1. Import DB via [Dev DB Restore](#dev-db-restore)  

### Database access via SequelPro is as follows:

**Important:** DO NOT ALTER DATABASE without a backup. ALWAYS clear cache in Craft Settings and Backup your database before database export, and ALWAYS backup and export current database in SequelPro before import.

##### Development Database
* SSH Tab  
* Name: `MariaDB`  
* MySQL Host: `127.0.0.1`  
* Username: `root`  
* Password: *None*  
* Database: `PROJECT_cmsdb_dev`  
* Port: (default)  

### Dev DB Backup

1. `cd data`  
1. Script will need execute permissions `chmod +x ./backup-db.sh`  
1. `./backup-db.sh`  
1. Enter your first name  

### Dev DB Restore

1. `cd data`  
1. Script will need execute permissions `chmod +x ./restore-db.sh`  
1. `./restore-db.sh`  
1. Choose a backup to restore.  

### Adding Plugins

This is instructions for plugins that have public repositories

1. Through SourceTree or the terminal add a new submodule.  
1. The path/url is the repository url of the plugin  
1. Local Relative Path: is `craft_plugins/PLUGIN_REPO_NAME`  
1. Plugin needs to be added to `grunt/copy.coffee`  

```
{
# PLUGIN_NAME Plugin
expand: true
cwd: 'craft_plugins/PLUGIN_REPO_NAME'
src: 'sub_folder_of_plugin_to_copy_over/**'
dest: 'dist/craft/plugins'
filter: 'isFile'
}
```

If the plugin has no subfolder to copy over use `src: '**'` instead and add the folder name to dest like: `dist/craft/plugins/EXAMPLE_PLUGIN`

If the plugin does not have a public repository. You can just copy the plugin folder into `src/craft_config/plugins`

### Updating Fontello

1. Visit [Fontello.com](http://fontello.com/)  
1. Import existing `src/fontello/config.json`  
1. Add / Remove icons  
1. Download new `config.json`  
1. Replace `src/fontello/config.json` with new `config.json`
1. Restart `grunt`  

### Getting Media files

This will rsync down the media files from the server. It will most likely ask for a password when run.

##### From Prod
1. script will need execute permissions `chmod +x ./rsync_media_prod.sh`  
1. `./rsync_media_prod.sh`  

##### From Stage
1. script will need execute permissions `chmod +x ./rsync_media_stage.sh`  
1. `./rsync_media_stage.sh`  

### Upgrading Craft CMS to the latest version
* Update the version in `grunt/curl.coffee`.  
* Run `grunt craft-update`  
