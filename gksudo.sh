#!/bin/bash
if [ -z "$1" ]; then echo Please pass command.
else

sudo -k
zenity --password --title="Permission Required" | sudo -p "" -S $@
if [ $? -ne 0 ]; then
  zenity --error --text="sudo threw an error."
else
  exit 0
fi

fi
