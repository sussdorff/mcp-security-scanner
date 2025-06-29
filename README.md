# MCP Security Scanner

A security scanner for MCP (Model Context Protocol) servers to detect malicious code and vulnerabilities.

## Features

- Scans JavaScript, TypeScript, and JSON files for security issues
- Detects suspicious patterns like remote code execution, shell commands, and file system manipulation
- Filters out false positives from legitimate package manager files
- Fast scanning with minimal dependencies
- Integrates seamlessly with Claude Code

## Installation

```bash
# Clone the repository
git clone https://github.com/sussdorff/mcp-security-scanner.git ~/code/mcp/mcp-security-scanner

# Install the scanner
cd ~/code/mcp/mcp-security-scanner
./install.sh
```

The installer will:
- Copy the `scan-mcp` command to `~/.local/bin/`
- Make it executable
- Provide instructions for adding `~/.local/bin` to your PATH if needed

## Usage

```bash
# Scan current directory
scan-mcp

# Scan specific directory
scan-mcp /path/to/mcp-server

# Example output
🔍 MCP Security Scanner - Claude Code Integration
Scanning: /path/to/project

Running security scan...

✅ No security issues detected!
The MCP server appears clean and safe for use.
```

## Security Patterns Detected

### Critical Issues
- **Remote code execution**: `eval()`, `Function()`, `new Function()`
- **Shell command execution**: `child_process.exec()`, `child_process.spawn()`
- **File system manipulation**: Unauthorized file operations
- **Suspicious network requests**: HTTP requests to unknown domains

### High Risk Issues
- **Environment variable access**: Unexpected environment variable usage
- **Crypto operations**: Cryptographic functions in suspicious contexts
- **Base64 obfuscation**: Long base64 strings (excluding package integrity hashes)

## False Positive Prevention

The scanner intelligently filters out common false positives:
- Skips security checks for `package.json` and `package-lock.json`
- Whitelists legitimate domains (npm registry, GitHub, common CDNs)
- Excludes integrity hashes and standard package manager content

## Updating

To update the scanner to the latest version:

```bash
cd ~/code/mcp/mcp-security-scanner
git pull
./install.sh
```

## Uninstalling

```bash
rm ~/.local/bin/scan-mcp
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with various MCP servers
5. Submit a pull request

## License

MIT License - see LICENSE file for details.

## Security

This tool is designed for defensive security analysis only. Report security issues privately to the maintainer.