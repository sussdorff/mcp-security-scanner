# MCP Security Scanner

> **⚠️ DEPRECATED: This project is no longer actively maintained.**
> 
> **We recommend using [mcp-watch](https://github.com/kapilduraphe/mcp-watch) for comprehensive MCP security scanning.**

---

## 🚀 Recommended Alternative: mcp-watch

**mcp-watch** is a superior, actively maintained MCP security scanner that provides:

- **MCP-specific vulnerability detection** (prompt injection, tool poisoning, parameter injection)
- **Research-backed patterns** from HiddenLayer, Invariant Labs, Trail of Bits
- **Comprehensive coverage** of AI/ML security threats
- **Professional reporting** with severity levels and JSON output
- **Active development** with regular updates

### Quick Start with mcp-watch

```bash
# Install
npm install -g mcp-watch

# Scan your MCP server
mcp-watch scan /path/to/your/mcp-server

# High severity issues only
mcp-watch scan . --severity high

# JSON output
mcp-watch scan . --format json
```

---

## Migration Guide

### Why We Recommend mcp-watch

After thorough testing, we found that **mcp-watch** provides superior security coverage for MCP servers:

| Feature | This Scanner | mcp-watch |
|---------|-------------|-----------|
| MCP-specific vulnerabilities | ❌ | ✅ |
| Prompt injection detection | ❌ | ✅ |
| Tool poisoning detection | ❌ | ✅ |
| Parameter injection detection | ❌ | ✅ |
| Research-backed patterns | ❌ | ✅ |
| Active development | ❌ | ✅ |
| False positive rate | Low | Moderate |
| General malware detection | ✅ | ❌ |

### Comparison Example

**Our scanner result** on timing-mcp-server:
```
✅ No security issues detected!
```

**mcp-watch result** on timing-mcp-server:
```
❌ Found 6 critical/high severity vulnerabilities
⚠️ 23 total issues detected
- Automatic content publishing risks
- Untrusted data processing
- Toxic agent flows
```

**Verdict:** mcp-watch correctly identified that legitimate MCP functionality can pose security risks, while our scanner missed these MCP-specific concerns.

### Migration Steps

1. **Uninstall this scanner:**
   ```bash
   rm ~/.local/bin/scan-mcp
   ```

2. **Install mcp-watch:**
   ```bash
   npm install -g mcp-watch
   ```

3. **Scan your MCP servers:**
   ```bash
   mcp-watch scan /path/to/your/mcp-server --severity high
   ```

## About This Scanner (Legacy)

This scanner was designed for general malicious code detection but has been superseded by mcp-watch's MCP-specific capabilities.

## Legacy Installation (Not Recommended)

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