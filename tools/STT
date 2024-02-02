#!/bin/bash

####################### Script-to-Tool #######################
#        Tool for BSM to allow conversion of scripts         #
#           into BSM tool. Tool creation is local            #
#              Tool can be exported and shipped              #
# Utilize `bsm <-a|--add-tool> <tool>` to add external tools #
##############################################################

# MAIN
if [[ "$1" == "" ]]; then
  echo "Usage: STT <script>"
else
  # Grab BSM variables
  repo="$(find ~ -type d -name "Bash-Script-Manager")"
  if [ -e /bsm/.bsm-vars ]; then
    . /bsm/.bsm-vars
  elif [ -e ~/bsm/.bsm-vars ]; then
    . ~/bsm/.bsm-vars
  else
    . $repo/.bsm-vars # Fallback to repo version
  fi
  if [[ "$(find $BSM_SCRIPTS -type f -name "$1")" != "" ]]; then
    cp "$(find $BSM_SCRIPTS -type f -name "$1")" "$BSM_TOOLS"
  else
    echo "No script found by the name of $1"
  fi
fi