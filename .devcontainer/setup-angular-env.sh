#!/usr/bin/env bash

# Debug: Print environment and paths
echo "=== Starting Environment Setup ==="
echo "Current PATH: $PATH"
echo "User: $(whoami)"
echo "Home: $HOME"

# Initialize NVM - use both standard locations
if [ -s "/usr/local/share/nvm/nvm.sh" ]; then
    echo "Initializing NVM from /usr/local/share/nvm/nvm.sh"
    export NVM_DIR="/usr/local/share/nvm"
    . "/usr/local/share/nvm/nvm.sh"
elif [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "Initializing NVM from $HOME/.nvm/nvm.sh"
    export NVM_DIR="$HOME/.nvm"
    . "$HOME/.nvm/nvm.sh"
else
    echo "ERROR: NVM not found! Trying to locate it..."
    find / -name nvm.sh 2>/dev/null
    echo "Falling back to manual NVM initialization"
    export NVM_DIR="${NVM_DIR:-/usr/local/share/nvm}"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# Verify NVM initialization
echo "NVM_DIR: $NVM_DIR"
if ! command -v nvm &> /dev/null; then
    echo "ERROR: NVM command still not available!"
    echo "Trying alternative approach..."
    # Manual Node installation as fallback
    export NODE_VERSION="12.22.12"
    export NODE_PATH="/usr/local/lib/node_modules"
    export PATH="/usr/local/bin:$PATH"
    echo "Installing Node $NODE_VERSION directly..."
    apt-get update
    apt-get install -y curl
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# Install and use specific Node version
echo "Installing Node 12.22.12..."
nvm install 12.22.12
nvm use 12.22.12

# Configure global npm path
echo "Configuring npm global path..."
npm config set prefix /usr/local/share/npm-global

# Install Angular CLI
echo "Installing Angular CLI 9.1.15..."
npm install -g @angular/cli@9.1.15

# Determine shell type and configuration file
if [ -n "$ZSH_VERSION" ]; then
    RC_FILE="$HOME/.zshrc"
    SHELL_NAME="zsh"
elif [ -n "$BASH_VERSION" ]; then
    RC_FILE="$HOME/.bashrc"
    SHELL_NAME="bash"
else
    RC_FILE="$HOME/.profile"
    SHELL_NAME="sh"
fi

echo "Using $SHELL_NAME shell with RC file: $RC_FILE"

# Create shell RC file if it doesn't exist
touch "$RC_FILE"

# Update PATH
echo "Updating PATH..."
echo "export PATH=\"/usr/local/share/npm-global/bin:/usr/local/share/nvm/versions/node/v12.22.12/bin:\$PATH\"" >> "$RC_FILE"

# Set NODE_PATH
echo "export NODE_PATH=\"/usr/local/share/npm-global/lib/node_modules\"" >> "$RC_FILE"

# Set Angular CLI options
echo "export NG_CLI_OPTIONS='--host 0.0.0.0 --port 4200 --disable-host-check'" >> "$RC_FILE"
echo "export NG_CLI_HOST=0.0.0.0" >> "$RC_FILE"
echo "export NG_CLI_PORT=4200" >> "$RC_FILE"
echo "export NG_DISABLE_HOST_CHECK=true" >> "$RC_FILE"

# Initialize NVM for future sessions
echo "Configuring NVM for future sessions..."
echo 'export NVM_DIR="/usr/local/share/nvm"' >> "$RC_FILE"
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$RC_FILE"
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> "$RC_FILE"

# Apply changes to current session
echo "Applying changes to current session..."
export PATH="/usr/local/share/npm-global/bin:/usr/local/share/nvm/versions/node/v12.22.12/bin:$PATH"
export NODE_PATH="/usr/local/share/npm-global/lib/node_modules"
export NG_CLI_OPTIONS='--host 0.0.0.0 --port 4200 --disable-host-check'
export NG_CLI_HOST=0.0.0.0
export NG_CLI_PORT=4200
export NG_DISABLE_HOST_CHECK=true

# Verify installation
echo "=== Verification ==="
echo "Node version: $(node -v || echo 'NOT FOUND')"
echo "NPM version: $(npm -v || echo 'NOT FOUND')"
echo "Angular CLI version: $(ng version | grep 'Angular CLI' || echo 'NOT FOUND')"
echo "PATH: $PATH"

# Final message
echo "=== Environment Setup Complete ==="
echo "To apply changes in new terminals:"
echo "  source $RC_FILE"