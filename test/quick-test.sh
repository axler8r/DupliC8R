#!/usr/bin/env zsh

# Quick test runner for common scenarios

set -euo pipefail

readonly PROJECT_ROOT="$(cd "$(dirname "${0:A}")/.." && pwd)"
readonly TEST_SCRIPT="$(dirname "${0:A}")/full-test.sh"

# Colors for output  
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m'

info() {
    echo -e "${BLUE}[QUICK-TEST]${NC} $*"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $*"
}

warning() {
    echo -e "${YELLOW}[NOTE]${NC} $*"
}

echo "🚀 DuplIC8R Quick Test Runner"
echo "============================"
echo

# Full test sequence
full_test() {
    info "Running full test sequence..."
    echo
    
    info "Step 1: Building container image"
    if ! "${TEST_SCRIPT}" build; then
        echo "❌ Build failed"
        return 1
    fi
    echo
    
    info "Step 2: Starting test container"
    if ! "${TEST_SCRIPT}" run; then
        echo "❌ Container start failed"
        return 1
    fi
    echo
    
    info "Step 3: Testing basic Ansible playbook"
    if ! "${TEST_SCRIPT}" test; then
        echo "❌ Basic test failed"
        return 1
    fi
    echo
    
    success "✅ Full test sequence completed!"
    echo
    warning "Container is still running. Use './full-test.sh stop' to clean up."
}

# Development test
dev_test() {
    info "Running development branch test..."
    echo
    
    if ! "${TEST_SCRIPT}" test --development --verbose; then
        echo "❌ Development test failed"
        return 1
    fi
    
    success "✅ Development test completed!"
}

# Interactive test
interactive_test() {
    info "Starting interactive test session..."
    echo
    
    if ! docker ps -q -f name="duplic8r-test" | grep -q .; then
        info "Starting container first..."
        if ! "${TEST_SCRIPT}" run; then
            echo "❌ Failed to start container"
            return 1
        fi
    fi
    
    info "Opening shell in test container..."
    "${TEST_SCRIPT}" exec
}

# Show menu if no args
if [[ $# -eq 0 ]]; then
    echo "Choose a test scenario:"
    echo "  1) Full test (build + run + test)"
    echo "  2) Development test (test dev branch)"
    echo "  3) Interactive shell"
    echo "  4) Just run Ansible test"
    echo "  5) Clean up and exit"
    echo
    echo -n "Select option [1-5]: "
    read choice
    echo
    
    case "$choice" in
        1) full_test ;;
        2) dev_test ;;
        3) interactive_test ;;
        4) "${TEST_SCRIPT}" test ;;
        5) 
            "${TEST_SCRIPT}" clean
            echo "🧹 Cleaned up!"
            ;;
        *) 
            echo "Invalid choice"
            exit 1
            ;;
    esac
else
    # Handle command line args
    case "$1" in
        full|all) full_test ;;
        dev|development) dev_test ;;
        shell|interactive) interactive_test ;;
        test) "${TEST_SCRIPT}" test ;;
        clean) "${TEST_SCRIPT}" clean ;;
        *)
            echo "Usage: $0 [full|dev|shell|test|clean]"
            exit 1
            ;;
    esac
fi
