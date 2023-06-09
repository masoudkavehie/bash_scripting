#!/bin/bash

read -p "Enter the path to the file that you want to backup: " backup_path

backup() {
  if [ -f "$1" ]; then
    mkdir -p /tmp/backup
    local backup_path="/tmp/backup/$(basename ${1}).$(date +%F).bk"
    echo "Backing up $1 to ${backup_path}"
    cp "$1" "$backup_path"
    return 0
  else
    echo "ERROR: file doesn't exist"
    return 1
  fi
}

backup "$backup_path"

if [ $? -eq 0 ]; then
	echo "Backup successfully"
	exit 0
else
	exit 1
fi
