pluginPath=${ZSH}/custom/plugins/omz-git

rm -rf ${pluginPath}

git clone https://github.com/tnwinc/omz-git.git ${pluginPath}

echo "Open your .zshrc file and add omz-git to your plugins."
echo "You should end up with something like plugins=(git omz-git)."
echo "Then, either restart your terminal or run source ~/.zshrc"

read -p "Would you like to set up defaults for The Network? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

./tnwinc-setup.sh
