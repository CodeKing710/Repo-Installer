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

bsm: v2.1.0
bsm-install: v2.0.0

__BSM Features__

- Create scripts for Python, Node, Ruby, and LISP
  - Predefine script type without using file extensions via creation arguments
- Open scripts for editing (Default nano, FTC editor selector)
- Remove scripts
- Add/Link scripts to BSM directory
- List scripts
- Support to create and open non-existent scripts when using `-o`
- ! NEW ! Export scipts to desired location
- ! NEW ! Configure certain aspects of BSM
- ! NEW ! Interactive mode for the less CLI-inclined (Base and Install)

__BSM-Install Features__

- Install BSM from cloned repo (Even when fully installed)
- Uninstall BSM completely (no remnants)
- Repair BSM
- View BSM logs
- Clear logs and scripts
- Interactive mode

### Features to Come (FTC)

- Generate script files for quick-launching larger programs (i.e. start a web server for Node, Python, or Ruby)
- Sample/System Tool scripts?

### Extra commit messages

_BSMv2 is basically ready for initial release_
_Completed interactive mode_
_Completed interactive mode bug fixes_
_Squashed more bugs_