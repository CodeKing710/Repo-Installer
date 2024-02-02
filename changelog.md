# Changelog

__This is the changelog__
__You will see patches from here__
__Refer to this file instead of the commits__
__Version info, patch notes, and what's new will appear here__

### What's New

BSM v2 comes with a major overhaul under the hood to ensure a better user experience and efficient handling of commands, as well as some much needed features to help make BSM more robust. BSM now supports interactive mode as well as command mode. Command mode uses sub commands instead of arguments to define actions and values.

### Patch Notes

- No patches to report

### Version Info

bsm: v2.2.1
bsm-install: v2.0.7

__BSM Features__

- Create scripts for Python, Node, Ruby, and LISP
  - Predefine script type without using file extensions via creation arguments
- Open scripts for editing (Default nano, FTC editor selector)
- Remove scripts
- Add/Link scripts to BSM directory
- List scripts
- Support to create and open non-existent scripts when using `-o`
- Export scipts to desired location
- Configure certain aspects of BSM
- Interactive mode for the less CLI-inclined (Base and Install)
- ! NEW ! Git Bash support

__BSM-Install Features__

- Install BSM from cloned repo (Even when fully installed)
- Uninstall BSM completely (no remnants)
- Repair BSM
- View BSM logs
- Clear logs and scripts
- Interactive mode

### Features to Come (FTC)

- Generate script files for quick-launching larger programs (i.e. start a web server for Node, Python, or Ruby)
- Sample/System Tool scripts
- Tool Manager (add,remove,update tools)
- STT (Script-to-Tool converter)

### Extra commit messages

__

### BSM-Next

__Features__

- Add autocompletion for CLI users (command and arg modes)
- Swap installer to repo-installer
- Tool manager for managing toolset
- Adjust BSM to be even more efficient and robust
