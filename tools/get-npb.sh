#!/bin/bash

if ! command -v np &> /dev/null; then
  if ! command -v npm &> /dev/null; then
    sudo snap install --edge node --classic
  fi
  npm i -g np-builder
else
  echo "Node Project Builder already installed! To use, call 'np -n [NAME]' to get started!"
fi