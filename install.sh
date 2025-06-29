#!/bin/bash

# MCP Security Scanner Installation Script
# This script installs the scan-mcp command to ~/.local/bin

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Installing MCP Security Scanner...${NC}"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SCRIPT="$SCRIPT_DIR/bin/scan-mcp"

# Check if source script exists
if [ ! -f "$SOURCE_SCRIPT" ]; then
    echo -e "${RED}❌ Error: scan-mcp script not found at $SOURCE_SCRIPT${NC}"
    exit 1
fi

# Create ~/.local/bin if it doesn't exist
LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$LOCAL_BIN"

# Copy script to ~/.local/bin
TARGET_SCRIPT="$LOCAL_BIN/scan-mcp"
if [ -f "$TARGET_SCRIPT" ]; then
    echo -e "${YELLOW}⚠️  Existing scan-mcp found, backing up...${NC}"
    mv "$TARGET_SCRIPT" "$TARGET_SCRIPT.backup.$(date +%s)"
fi

cp "$SOURCE_SCRIPT" "$TARGET_SCRIPT"
chmod +x "$TARGET_SCRIPT"

echo -e "${GREEN}✅ MCP Security Scanner installed successfully!${NC}"
echo ""

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$LOCAL_BIN:"* ]]; then
    echo -e "${YELLOW}⚠️  ~/.local/bin is not in your PATH${NC}"
    echo "Add this line to your shell profile (~/.bashrc, ~/.zshrc, etc.):"
    echo ""
    echo -e "${BLUE}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
    echo ""
    echo "Then reload your shell or run: source ~/.bashrc (or ~/.zshrc)"
    echo ""
fi

echo -e "${BLUE}📖 Usage:${NC}"
echo "  scan-mcp                    # Scan current directory"
echo "  scan-mcp /path/to/project   # Scan specific directory"
echo ""
echo -e "${BLUE}🔄 To update:${NC}"
echo "  git pull && ./install.sh"
echo ""
echo -e "${GREEN}🎉 Installation complete! You can now use 'scan-mcp' from anywhere.${NC}"