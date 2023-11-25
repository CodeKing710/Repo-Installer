# Bash Script Manager

This is a local script manager that allows you to add custom scripts to your system without affecting the baseline OS scripts.

__NOTE: THIS SCRIPT IS INTENDED FOR USE ON DEBIAN/UBUNTU BASED DISTRIBUTIONS!__
__FUNCTIONS WITH WINDOWS SUBSYSTEM FOR LINUX!__

Support for Bash, Node, Python, Ruby, and LISP scripts.

### Installation

To install, run the install script once repo is cloned. The repo should be cloned to your home directory, or `~`.

If the install script won't execute, run the following:

`. ~/Bash-Script-Manager/bsm-install`

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


### Extra Goodies

##### Fixing BSM

BSM offers a few more options, but they pertain only to the instance itself. BSM is designed to be preconfigured in such a way that you, the user, don't have to worry about where the file goes or whether it will execute or not. BSM handles all this. Sometimes though, BSM may bug out due to how the file was edited or if the file was modded by a different program other than a text editor. One way to fix this is to run `bsm -I` or `bsm --install`. Assuming normal installation from `bsm-install` went well, this command should setup BSMs configuration files again, allowing you to once again access your files.

**Notice** the capitalization of the argument. The capitalization in this case signifies that it modifies BSM directly.

Another way to fix it is to just plain uninstall it and go through installation the normal way again. This can be done via `bsm -U` or `bsm --uninstall`. This will completely remove BSM from your system, including PATH links and any leftover scripts and config files.

But let's say that your BSM install works just fine, but the underlying dependencies that run specific types of scripts are broken. Using `bsm -R` or `bsm --reinstall-deps` will reinstall a specific dependency or all of them based on whether you pass the option or not. Naming is not case sensitive and some allow for the nickname to be passed instead. Available deps include:

- Node
- Python
- Ruby
- LiSP

**NOTE**
All install related commands can also be passed to `bsm-install`, via `bsm-install`, `bsm-install -u`, and `bsm-install -rd [...]` respectively. `bsm-install` also has a special function that allows you to clear any or all script directories and keep the config structure intact. By using `bsm-install -c [...]`, you can specify a name or none to remove any or all scripts. Available script directories include:

- node
- python
- ruby
- lisp
- bash

If you don't want to clear any scripts and want to just clear logs, use `bsm-install -c log`.


### Features to come
- Export script(s) to a specific location
- Generate script files for quick-launching larger programs (i.e. start a web server for Node, Python, or Ruby)
- Sample/System Tool scripts?

Report bugs to cjrox01@yahoo.com
Let me know if there are any other features you may want! Feedback is welcome!
