#!/bin/bash

# Simple Ansible-based installer for duplic8r
# Replaces the complex bash script with clean Ansible automation

set -euo pipefail

# Colors for output
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $*"
}

# Detect environment
if [[ "${IN_CONTAINER:-}" == "true" ]]; then
    EXTRA_VARS="features.snaps=false features.fonts=false features.icons=false features.kitty=false features.docker=false"
    info "Container environment detected - disabling GUI features"
else
    EXTRA_VARS=""
fi

# Parse command line arguments
DEVELOPMENT=false
GUI=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --development)
            DEVELOPMENT=true
            shift
            ;;
        --gui)
            GUI=true
            shift
            ;;
        --help)
            cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --development    Install development branch instead of stable
  --gui           Enable GUI applications and features
  --help          Show this help message

Environment Variables:
  IN_CONTAINER    Set to 'true' to disable desktop-specific features

Examples:
  $0                    # Standard installation
  $0 --development      # Install development branch
  $0 --gui             # Include GUI packages
  IN_CONTAINER=true $0  # Container-friendly installation

EOF
            exit 0
            ;;
        *)
            warning "Unknown option: $1"
            shift
            ;;
    esac
done

# Build extra vars
if [[ "$DEVELOPMENT" == "true" ]]; then
    EXTRA_VARS="${EXTRA_VARS} duplic8r.branch=development"
fi

if [[ "$GUI" == "true" ]]; then
    EXTRA_VARS="${EXTRA_VARS} features.gui=true"
fi

# Ensure ansible is installed
if ! command -v ansible-playbook &> /dev/null; then
    info "Installing Ansible..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install -y ansible
    else
        echo "Please install Ansible manually"
        exit 1
    fi
fi

# Run the playbook
info "Starting duplic8r installation with Ansible..."
info "Extra vars: ${EXTRA_VARS}"

cd "$(dirname "$0")"

if [[ -n "$EXTRA_VARS" ]]; then
    ansible-playbook site.yml --extra-vars "$EXTRA_VARS"
else
    ansible-playbook site.yml
fi

success "Installation complete!"
info "Log out and back in to use zsh as your default shell"
info "Or run: exec zsh"
