# Bash Script Manager

This is a local script manager that allows you to add custom scripts to your system without affecting the baseline OS scripts.

__NOTE: THIS SCRIPT IS INTENDED FOR USE ON DEBIAN BASED LINUX DISTRIBUTIONS!__

Support for Bash, Node, Python, Ruby, and LISP scripts.

### Installation

To install, run the install script once repo is cloned.

If the install script won't execute, run the following:

`. $GITREPOPATH/install`

_GITREPOPATH_ is the path to the cloned repo.

### Usage

Making a script of any kind is very simple. You can do this one of two ways. You can either create the file and be done like so;

`bsm -c "[SCRIPT]"`

Or you can have it open right away for editing.

`bsm -o "[SCRIPT]"`

To remove a script is as simple as quoting the name of the script you want removed. Please note that to remove any script you just input the name, no file extensions necessary. If you do input a file extension the manager will still know where to look and remove the script. This argument is not chainable as it accepts any number of script names to mark for removal. (Example below)

`bsm -r my-script.py #Removes python script`
`bsm -r my-script #Does the same as the above`
`bsm -r my-script my-2-script #Removes both scripts`

Another way you can add scripts to your system is through the linking of an existing script. This will ensure the script can be run directly from the terminal no matter where you are.

`bsm -L "[PATH]" "[SCRIPTNAME]"`

If you want to add a pre-existing script and move it to the scripts folder to be opened directly by BSM, you can do that via the "-a" flag. It stands for "--add" to add an existing script directly to BSM

`bsm -a "[PATH]"`

To see every available script that has been added to your custom scripts, you can use the "-l" flag to list out all the scripts in a nice easy-to-read fashion.

`bsm -l`

For any help in case you forget how to use the command, you can use `bsm -h` o `bsm --help`. Versioning info can be found with `bsm -v`.