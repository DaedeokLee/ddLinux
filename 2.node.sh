curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash
source ~/.bashrc
nvm install stable

sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
