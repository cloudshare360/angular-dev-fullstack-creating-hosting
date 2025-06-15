#!/bin/bash

# Initialize NVM
source /usr/local/share/nvm/nvm.sh

# Install and use specific Node version
nvm install 12.22.12
nvm use 12.22.12

# Configure global npm path
npm config set prefix /usr/local/share/npm-global

# Install Angular CLI
npm install -g @angular/cli@9.1.15

# Update PATH in bashrc
echo "export PATH=\"/usr/local/share/npm-global/bin:/usr/local/share/nvm/versions/node/v12.22.12/bin:\$PATH\"" >> ~/.bashrc
echo "export NODE_PATH=\"/usr/local/share/npm-global/lib/node_modules\"" >> ~/.bashrc

# Set Angular CLI options
echo "export NG_CLI_OPTIONS='--host 0.0.0.0 --port 4200 --disable-host-check'" >> ~/.bashrc

# Set Angular environment variables
echo "export NG_CLI_HOST=0.0.0.0" >> ~/.bashrc
echo "export NG_CLI_PORT=4200" >> ~/.bashrc
echo "export NG_DISABLE_HOST_CHECK=true" >> ~/.bashrc

# Update current session
export PATH="/usr/local/share/npm-global/bin:/usr/local/share/nvm/versions/node/v12.22.12/bin:$PATH"
export NODE_PATH="/usr/local/share/npm-global/lib/node_modules"
export NG_CLI_OPTIONS='--host 0.0.0.0 --port 4200 --disable-host-check'
export NG_CLI_HOST=0.0.0.0
export NG_CLI_PORT=4200
export NG_DISABLE_HOST_CHECK=true

# Verify installation
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"
echo "Angular CLI version: $(ng version | grep 'Angular CLI')"