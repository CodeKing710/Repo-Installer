# Repo Installer (ri)

This script will install a GitHub repo designed with program installation in mind. Currently will install any type of program if configured to do so. You can let Repo Installer just copy the contents of the repo to wherever it needs to go (takes .gitignore into account and is like cloning a repo normally). Make a `ri.cfg` file at the root of the repo for more precise install control. The command must be run in the repo you want to install.

## Genereate config file (WiP)
Can generate a config file by passing `-g` to the command, followed by either a directory (`-d`) or a list of files. All directories must be tagged with a `-d` prior so that way Repo Installer knows.
