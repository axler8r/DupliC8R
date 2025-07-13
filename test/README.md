# DuplIC8R Testing Guide

## Quick Start

The fastest way to test the new Ansible-based DuplIC8R setup:

```bash
# Interactive menu
cd test && ./quick-test.sh

# Or run specific tests
cd test && ./quick-test.sh full      # Complete test sequence
cd test && ./quick-test.sh dev       # Test development branch
cd test && ./quick-test.sh shell     # Interactive container shell
```

## Test Scripts

### `full-test.sh` - Main Test Script

Comprehensive testing script for the Ansible-based setup:

```bash
# Build test container
./full-test.sh build

# Start container
./full-test.sh run

# Run Ansible playbook tests
./full-test.sh test                    # Basic test
./full-test.sh test --development      # Test dev branch
./full-test.sh test --gui --verbose    # GUI features with verbose output

# Interactive testing
./full-test.sh exec                    # Open shell
./full-test.sh exec "ls -la"           # Run specific command

# Cleanup
./full-test.sh stop                    # Stop container
./full-test.sh clean                   # Remove everything
```

### `quick-test.sh` - Simplified Test Runner

Easy-to-use wrapper for common test scenarios:

- **Full Test**: Builds image, starts container, runs basic Ansible test
- **Development Test**: Tests development branch with verbose output
- **Interactive Shell**: Opens shell in test container
- **Basic Test**: Just runs Ansible playbook
- **Clean**: Removes container and image

## Test Environment

The test environment uses:

- **Base Image**: Ubuntu 24.04
- **Container Name**: `duplic8r-test`
- **Test User**: `dotfile` (mimics real user setup)
- **Packages**: ansible-core, ansible-lint, git, stow
- **Working Directory**: `/home/dotfile/.duplic8r`

## Test Scenarios

### 1. Basic Functionality Test

```bash
./full-test.sh build
./full-test.sh run
./full-test.sh test
```

Verifies:
- ✅ Ansible playbook runs without errors
- ✅ Dotfiles are installed via GNU Stow
- ✅ Basic packages are installed
- ✅ Shell configuration is applied

### 2. Development Branch Test

```bash
./full-test.sh test --development --verbose
```

Tests:
- ✅ Development branch features
- ✅ Verbose Ansible output for debugging
- ✅ Extra development tools installation

### 3. GUI Features Test

```bash
./full-test.sh test --gui
```

Tests:
- ✅ GUI package installation
- ✅ Desktop environment configurations
- ✅ Graphics-related dotfiles

### 4. Interactive Testing

```bash
./full-test.sh exec
# Inside container:
cd ~/.duplic8r/ansible
ansible-playbook site.yml --tags "shell"  # Test specific roles
ls -la ~/                                 # Check dotfiles
zsh --version                            # Verify installations
```

## Validation Points

After running tests, the script automatically checks:

1. **Dotfiles Installation**
   - Git configuration files present
   - Symlinks created correctly
   - Stow packages applied

2. **Package Installation**
   - Zsh installed and accessible
   - Git available
   - Stow working correctly

3. **ASDF Installation**
   - ASDF directory exists
   - Version manager setup

4. **Shell Configuration**
   - Zsh configuration applied
   - Custom functions available

## Troubleshooting

### Container Issues

```bash
# Check container status
docker ps -a -f name=duplic8r-test

# View container logs
./full-test.sh logs

# Clean slate
./full-test.sh clean
```

### Ansible Issues

```bash
# Run with verbose output
./full-test.sh test --verbose

# Test specific roles
./full-test.sh exec "cd ~/.duplic8r/ansible && ansible-playbook site.yml --tags 'dotfiles'"

# Check Ansible syntax
./full-test.sh exec "cd ~/.duplic8r/ansible && ansible-playbook site.yml --syntax-check"
```

### Permission Issues

```bash
# Check file ownership in container
./full-test.sh exec "ls -la ~/.duplic8r"

# Fix ownership if needed
./full-test.sh exec "sudo chown -R dotfile:dotfile ~/.duplic8r"
```

## Integration with Development Workflow

### Before Committing Changes

```bash
# Test your changes
./quick-test.sh full

# If changes affect specific roles
./full-test.sh test --verbose
```

### Testing New Features

```bash
# Test in development mode
./full-test.sh test --development

# Interactive debugging
./full-test.sh exec
cd ~/.duplic8r/ansible
ansible-playbook site.yml --step  # Step through playbook
```

### Performance Testing

```bash
# Time the installation
time ./full-test.sh test

# Memory usage
./full-test.sh exec "free -h"
```

## Expected Test Results

A successful test run should show:

```
[INFO] Running Ansible playbook in container...
[SUCCESS] Ansible playbook completed successfully!
[INFO] Verifying installation...
=== Checking dotfiles ===
lrwxrwxrwx 1 dotfile dotfile .gitconfig -> .duplic8r/dotfiles/git/.gitconfig
=== Checking zsh ===
zsh 5.9
=== Checking stow ===
/usr/bin/stow
=== Checking asdf ===
drwxr-xr-x 8 dotfile dotfile .asdf
[SUCCESS] ✅ Test completed successfully!
```

## Next Steps

After successful testing:

1. Commit changes to feature branch
2. Create pull request
3. Update documentation
4. Consider additional test scenarios

The test environment provides a safe, reproducible way to validate that the new Ansible-based approach works correctly before deploying to real systems.
