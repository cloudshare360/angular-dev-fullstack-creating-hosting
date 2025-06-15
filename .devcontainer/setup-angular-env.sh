#!/bin/bash

# Detect shell type
if [[ -n "$ZSH_VERSION" ]]; then
    SHELL_TYPE="zsh"
    RC_FILE="$HOME/.zshrc"
elif [[ -n "$BASH_VERSION" ]]; then
    SHELL_TYPE="bash"
    RC_FILE="$HOME/.bashrc"
else
    # Fallback to bash if not detected
    SHELL_TYPE="bash"
    RC_FILE="$HOME/.bashrc"
    echo "WARNING: Shell not recognized. Defaulting to bash configuration."
fi

echo "Configuring for $SHELL_TYPE shell using $RC_FILE"

# Initialize NVM
[ -s "/usr/local/share/nvm/nvm.sh" ] && . "/usr/local/share/nvm/nvm.sh"

# Install and use specific Node version
nvm install 12.22.12
nvm use 12.22.12

# Configure global npm path
npm config set prefix /usr/local/share/npm-global

# Install Angular CLI
npm install -g @angular/cli@9.1.15

# Update PATH
EXPORT_PATH="export PATH=\"/usr/local/share/npm-global/bin:/usr/local/share/nvm/versions/node/v12.22.12/bin:\$PATH\""
echo "$EXPORT_PATH" >> "$RC_FILE"

# Set NODE_PATH
EXPORT_NODE_PATH="export NODE_PATH=\"/usr/local/share/npm-global/lib/node_modules\""
echo "$EXPORT_NODE_PATH" >> "$RC_FILE"

# Set Angular CLI options
EXPORT_CLI_OPTIONS="export NG_CLI_OPTIONS='--host 0.0.0.0 --port 4200 --disable-host-check'"
echo "$EXPORT_CLI_OPTIONS" >> "$RC_FILE"

# Set Angular environment variables
echo "export NG_CLI_HOST=0.0.0.0" >> "$RC_FILE"
echo "export NG_CLI_PORT=4200" >> "$RC_FILE"
echo "export NG_DISABLE_HOST_CHECK=true" >> "$RC_FILE"

# Source the RC file for current session
[ -s "$RC_FILE" ] && \. "$RC_FILE"

# Verify installation
echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"
echo "Angular CLI version: $(ng version | grep 'Angular CLI' || echo 'Angular CLI not found')"

# Final message
echo "Environment configured for $SHELL_TYPE shell"
echo "To apply changes in new terminals, restart your shell or run:"
echo "  source $RC_FILE"