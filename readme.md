# Bash Script Manager (v1.3.0)

This is a local script manager that allows you to add custom scripts to your system without affecting the baseline OS scripts.

__NOTE: THIS SCRIPT IS INTENDED FOR USE ON DEBIAN/UBUNTU BASED DISTRIBUTIONS!__<br>
__FUNCTIONS WITH WINDOWS SUBSYSTEM FOR LINUX!__

Support for Bash, Node, Python, Ruby, and LISP scripts.

### Installation

To install, run the install script once repo is cloned. If it won't open, run the following:

```
sudo chmod +x "$(find ~ -name bsm-install)"
```

Then try running again or run the following:

```
. "$(find ~ -name bsm-install)"
```

### Usage

Making a script of any kind is very simple. You can do this one of two ways. You can either create the file and be done like so;

```
bsm -c "[SCRIPT]"
```

Or you can have it open right away for editing. Open currently only supports creation of non-existent scripts via file extension.

```
bsm -o "[SCRIPT]"
```

The create argument for BSM allows you predefine the script type, either through passing the type before the name, or via file extension in the script name. Both ways result in the same output, it is just a matter of what you prefer.  If you would prefer to be able to define the script type in the open argument as well as the creation argument, let me know! This program is open-source as well as open-minded!

To remove a script is as simple as quoting the name of the script you want removed. Please note that to remove any script you just input the name, no file extensions necessary. If you do input a file extension the manager will still know where to look and remove the script. This argument is not chainable as it accepts any number of script names to mark for removal. (Example below)

```
bsm -r my-script.py #Removes python script
bsm -r my-script #Does the same as the above
bsm -r my-script my-2-script #Removes both scripts
```

Another way you can add scripts to your system is through the linking of an existing script. This will ensure the script can be run directly from the terminal no matter where you are.

```
bsm -L "[PATH]" "[SCRIPTNAME]"
```

If you want to add a pre-existing script and move it to the scripts folder to be opened directly by BSM, you can do that via the "-a" flag. It stands for "--add" to add an existing script directly to BSM

```
bsm -a "[PATH]"
```

To see every available script that has been added to your custom scripts, you can use the "-l" flag to list out all the scripts in a nice easy-to-read fashion.

```
bsm -l
```

If you named your script wrong, don't fret! You can use the `-n` flag to rename a script!

```
bsm -n [WRONG_SCRIPT] [NAME_YOU_WANT]
```

For any help in case you forget how to use the command, you can use `bsm -h` or `bsm --help`. Versioning info can be found with `bsm -v`.


### Extra Goodies

##### Fixing BSM

BSM-Install will assist in more than just installing and uninstalling BSM from your system. Utilizing the interactive feature of BSM-Install, you can choose the option to repair (3) the BSM installation. If your BSM version is out of date with the repo, you can reinstall by running the BSM-Install installer function again. On older versions of BSM, these commands can be run directly from BSM instead of BSM-Install, but also note that neither of them have interactive versions so refer to the help page for more info.

__NOTE: Ability to run these commands directly from BSM has been deprecated due to confliction of commands and confusion of argument names.__

Another way to fix it is to just plain uninstall it and go through installation the normal way again. This can be done via `bsm-install --uninstall` or from the interactive shell. This will completely remove BSM from your system, including PATH links and any leftover scripts and config files. You may have to execute your `~/.profile` again to ensure path is updated, or restart your terminal. Same applites to reinstall and fresh installations.

But let's say that your BSM install works just fine, but the underlying dependencies that run specific types of scripts are broken. Using `bsm-install --repair` will reinstall specific dependencies or all of them based on whether you pass the option or not. Naming is not case sensitive and some allow for the nickname to be passed instead. Available deps include:

- Node
- Python
- Ruby
- LiSP

By using `bsm-install --clear [...]`, you can specify a name or none to remove any or all scripts. Available script directories include:

- node
- python
- ruby
- lisp
- bash
- log

Refer to changelog for features, outstanding bugs, and more.

Report bugs to cjrox01@yahoo.com
Let me know if there are any other features you may want! Feedback is welcome!
