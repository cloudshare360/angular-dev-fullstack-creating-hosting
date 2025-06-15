#!/bin/bash

echo "🔧 Setting up Angular 9.1.9 with Node.js v12.22.0 on Ubuntu 20.04"

# Exit immediately if any command fails
set -e

# Use system-wide NVM location
export NVM_DIR="/usr/local/share/nvm"

# Load nvm if available
if [ -s "$NVM_DIR/nvm.sh" ]; then
  echo "📦 Loading existing nvm installation..."
  \. "$NVM_DIR/nvm.sh"
  \. "$NVM_DIR/bash_completion"
else
  echo "❌ Error: nvm not found at $NVM_DIR"
  exit 1
fi

# Install Node.js v12.22.0 if not already installed
if ! nvm list 12.22.0 &> /dev/null; then
  echo "📦 Installing Node.js v12.22.0..."
  nvm install 12.22.0
fi

# Set default Node version
echo "⚙️ Setting Node.js v12.22.0 as default..."
nvm use 12.22.0
nvm alias default 12.22.0

# Install Angular CLI v9.1.9 if not already installed
if ! ng version 2>/dev/null | grep -q '9.1.9'; then
  echo "📦 Installing Angular CLI v9.1.9..."
  npm install -g @angular/cli@9.1.9
fi

current_dir=$(pwd)
echo "The current directory is: $current_dir"

# Install angular project node modules
# echo "📦 Installing npm modules for Angular Project..."
# cd /workspaces/angular-fullstack-dev/angular-creating-and-hosting-a-full-stack-site/SourceCode/ExerciseFiles/01_02/End/buy-and-sell && npm install 

# Verify installations
echo "✅ Verifying installations..."
node -v
npm -v
ng version

# Configure Angular CLI options
echo "🔧 Configuring Angular CLI defaults..."
PROFILE_FILE="$HOME/.bashrc"

# Add Angular CLI options
if ! grep -q 'NG_CLI_OPTIONS' "$PROFILE_FILE"; then
  echo "🔄 Adding Angular CLI options to $PROFILE_FILE..."
  echo '' >> "$PROFILE_FILE"
  echo '# Angular CLI default options' >> "$PROFILE_FILE"
  echo "export NG_CLI_OPTIONS='--host 0.0.0.0 --port 4200 --disable-host-check'" >> "$PROFILE_FILE"
  echo "export NG_CLI_HOST=0.0.0.0" >> "$PROFILE_FILE"
  echo "export NG_CLI_PORT=4200" >> "$PROFILE_FILE"
  echo "export NG_DISABLE_HOST_CHECK=true" >> "$PROFILE_FILE"
fi

# Apply environment variables
source "$PROFILE_FILE"

echo "🎉 Setup complete! Node.js v12.22.0 and Angular CLI v9.1.9 are now available."
echo "🚀 Start your Angular projects with: ng new your-project --strict false"
