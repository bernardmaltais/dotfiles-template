#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

homedir=${HOME}

# dotfiles directory
dotfiledir=${homedir}/dotfiles

# list of files/folders to symlink in ${homedir}
files="aliases gitconfig bash_aliases"
directories="ssh kube"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"
echo "Pulling latest repo code"
#git pull
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# create symlinks (will overwrite old dotfiles)
for directory in ${directories}; do
    echo "Creating symlink to $directory in home directory."
    if [ -d "${homedir}/.${directory}" ]; then
        # echo "${homedir}/.${directory} already exist, unlinking."
        unlink ${homedir}/.${directory}
        if [ -d "${homedir}/.${directory}" ]; then
            mv ${homedir}/.${directory} ${homedir}/.${directory}-old
        fi
    fi
    ln -sf ${dotfiledir}/.${directory} ${homedir}/.${directory}
done

# Fix SSH key access
chmod 0600 ${homedir}/.ssh/*