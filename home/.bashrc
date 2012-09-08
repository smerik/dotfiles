#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source the Bash config files
if [ -d ${HOME}/.config/bash ] ; then
  for file in ${HOME}/.config/bash/* ; do
    source "$file";
  done
fi
