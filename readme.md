# Repo Installer (ri)

This script will install a GitHub repo designed with program installation in mind. Currently will install any type of program if configured to do so. You can let Repo Installer just copy the contents of the repo to wherever it needs to go (takes .gitignore into account and is like cloning a repo normally). Make a `ri.cfg` file at the root of the repo for more precise install control. The command must be run in the repo you want to install.

## How to Use

Using Repo-Installer is as simple as navigating to the repo you want to install and running `ri`. The `ri.cfg` file will take care of any install parameters. The structure of a config file is as follows;

__f__ - `f > file > destination` - Tells ri where to put a file

__d__ - `d > folder > destination` - Tells ri where to put a folder

__r__ - `r > folder > destination` - Tells ri where to put a folder (moves sub folders as well, same as `cp -r`)

__c__ - `c > file(s) > condition > destination_on_true > destination_on_false` - Tells ri where to put files based on the condition

__x__ - `x > script_file` - Tells ri to execute the script before moving on

__e__ - `e > message` - Tells ri to display a message


## Genereate config file (WiP)

Can generate a config file by passing `-g` to the command, followed by either a directory (`-d`) or a list of files. All directories must be tagged with a `-d` prior so that way Repo Installer knows.
