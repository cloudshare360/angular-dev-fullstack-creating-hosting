#!/bin/bash

echo "🔧 Setting up Angular 9.1.9 with Node.js v12.22.0 on macOS"

# Check if nvm is already installed
if [ ! -d "$HOME/.nvm" ]; then
  echo "📦 Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh  | bash
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js v12.22.0
echo "📦 Installing Node.js v12.22.0..."
nvm install 12.22.0
nvm alias default 12.22.0

# Verify installation
node -v
npm -v

# Install Angular CLI v9.1.9
echo "📦 Installing Angular CLI v9.1.9..."
npm install -g @angular/cli@9.1.9

ng version

# Update shell profile to persist environment
PROFILE_FILE="$HOME/.zshrc"

if ! grep -q 'NVM_DIR' "$PROFILE_FILE"; then
  echo "🔄 Updating $PROFILE_FILE to load nvm automatically..."
  echo 'export NVM_DIR="$HOME/.nvm"' >> "$PROFILE_FILE"
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$PROFILE_FILE"
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> "$PROFILE_FILE"
fi

source "$PROFILE_FILE"

echo "✅ Setup complete! Node.js v12.22.0 and Angular CLI v9.1.9 are now available globally."
echo "👉 Close and reopen your terminal or run: source ~/.zshrc"