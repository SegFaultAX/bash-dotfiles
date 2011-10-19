#!/usr/bin/env bash

# -------------------------------------------------------
# Author: Nathan Broadbent
# Source: https://github.com/ndbroadbent/ubuntu_config
# Retrieved: Oct 19, 2011
# -------------------------------------------------------

echo "== Installing ~/.bashrc & other related dot files..."
this_dir=$(pwd)

# Backup the existing 
now=$(date +%s)
cp ~/.bashrc ~/bashrc/backups/bashrc$now.old

# Assemble bashrc from parts
cat default.sh > ~/.bashrc
for part in path prompt aliases history; do
  cat $part.sh >> ~/.bashrc
done

source ~/.bashrc
