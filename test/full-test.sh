#!/usr/bin/env zsh

# test-ansible.sh - Test the new Ansible-based duplic8r setup

set -euo pipefail

# Colors for output  
readonly GREEN='\033[0;32m'
readonly BLUE='\033[0;34m'
readonly YELLOW='\033[1;33m'
readonly RED='\033[0;31m'
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

error() {
    echo -e "${RED}[ERROR]${NC} $*"
}

# Project root detection
readonly PROJECT_ROOT="$(cd "$(dirname "${0:A}")/.." && pwd)"
readonly CONTAINER_NAME="duplic8r-test"
readonly IMAGE_NAME="axler8r/dotfile-test:latest"

help() {
    cat <<EOF
Usage: $0 [COMMAND] [OPTIONS]

Commands:
    build       Build the test container image
    run         Run a new test container
    test        Run Ansible playbook in existing container
    exec        Execute command in container (default: /bin/bash)
    logs        Show container logs
    stop        Stop and remove container
    clean       Remove container and image
    help        Show this help

Options:
    --development   Use development branch for testing
    --gui          Enable GUI features in test
    --verbose      Show verbose Ansible output

Examples:
    $0 build                           # Build test image
    $0 run                            # Start container
    $0 test                           # Run Ansible playbook
    $0 test --development --verbose   # Test dev branch with verbose output
    $0 exec "ls -la"                  # Execute command in container
    $0 clean                          # Clean up everything

EOF
}

build_image() {
    info "Building test container image..."
    cd "${PROJECT_ROOT}"
    
    if ! test/build-dotfile; then
        error "Failed to build container image"
        return 1
    fi
    
    success "Container image built successfully"
}

run_container() {
    info "Starting test container..."
    
    # Stop existing container if running
    if docker ps -q -f name="${CONTAINER_NAME}" | grep -q .; then
        warning "Stopping existing container..."
        docker stop "${CONTAINER_NAME}" >/dev/null 2>&1 || true
    fi
    
    # Remove existing container if exists
    if docker ps -aq -f name="${CONTAINER_NAME}" | grep -q .; then
        docker rm "${CONTAINER_NAME}" >/dev/null 2>&1 || true
    fi
    
    # Run new container
    docker run -d \
        --name "${CONTAINER_NAME}" \
        --hostname duplic8r-test \
        "${IMAGE_NAME}" \
        sleep infinity
    
    success "Container started: ${CONTAINER_NAME}"
}

test_ansible() {
    local extra_args=""
    local ansible_args=""
    
    # Parse test options
    while [[ $# -gt 0 ]]; do
        case $1 in
            --development)
                extra_args="${extra_args} duplic8r.branch=development"
                shift
                ;;
            --gui)
                extra_args="${extra_args} features.gui=true"
                shift
                ;;
            --verbose)
                ansible_args="${ansible_args} -vv"
                shift
                ;;
            *)
                warning "Unknown test option: $1"
                shift
                ;;
        esac
    done
    
    # Check if container is running
    if ! docker ps -q -f name="${CONTAINER_NAME}" | grep -q .; then
        error "Container ${CONTAINER_NAME} is not running. Run '$0 run' first."
        return 1
    fi
    
    info "Running Ansible playbook in container..."
    if [[ -n "$extra_args" ]]; then
        info "Extra variables: ${extra_args}"
    fi
    
    # Build the command
    local cmd="cd /home/dotfile/.duplic8r/ansible && ansible-playbook site.yml"
    
    if [[ -n "$extra_args" ]]; then
        cmd="${cmd} --extra-vars '${extra_args}'"
    fi
    
    if [[ -n "$ansible_args" ]]; then
        cmd="${cmd} ${ansible_args}"
    fi
    
    info "Executing: ${cmd}"
    
    # Run the playbook
    if docker exec -it "${CONTAINER_NAME}" bash -c "${cmd}"; then
        success "Ansible playbook completed successfully!"
        
        # Verify some key results
        info "Verifying installation..."
        docker exec "${CONTAINER_NAME}" bash -c "
            echo '=== Checking dotfiles ==='
            ls -la /home/dotfile/.git* | head -5
            echo
            echo '=== Checking zsh ==='
            /usr/bin/zsh --version || echo 'zsh not found'
            echo
            echo '=== Checking stow ==='
            command -v stow || echo 'stow not found'
            echo
            echo '=== Checking asdf ==='
            ls -la /home/dotfile/.asdf || echo 'asdf not found'
        "
        
        success "✅ Test completed successfully!"
    else
        error "❌ Ansible playbook failed!"
        return 1
    fi
}

exec_command() {
    local cmd="${1:-/bin/bash}"
    
    if ! docker ps -q -f name="${CONTAINER_NAME}" | grep -q .; then
        error "Container ${CONTAINER_NAME} is not running. Run '$0 run' first."
        return 1
    fi
    
    info "Executing in container: ${cmd}"
    docker exec -it "${CONTAINER_NAME}" ${cmd}
}

show_logs() {
    if ! docker ps -aq -f name="${CONTAINER_NAME}" | grep -q .; then
        error "Container ${CONTAINER_NAME} does not exist."
        return 1
    fi
    
    docker logs "${CONTAINER_NAME}"
}

stop_container() {
    if docker ps -q -f name="${CONTAINER_NAME}" | grep -q .; then
        info "Stopping container..."
        docker stop "${CONTAINER_NAME}"
        success "Container stopped"
    else
        warning "Container is not running"
    fi
    
    if docker ps -aq -f name="${CONTAINER_NAME}" | grep -q .; then
        info "Removing container..."
        docker rm "${CONTAINER_NAME}"
        success "Container removed"
    fi
}

clean_all() {
    stop_container
    
    if docker images -q "${IMAGE_NAME}" | grep -q .; then
        info "Removing image..."
        docker rmi "${IMAGE_NAME}"
        success "Image removed"
    else
        warning "Image does not exist"
    fi
}

# Main command handling
case "${1:-help}" in
    build)
        build_image
        ;;
    run)
        run_container
        ;;
    test)
        shift
        test_ansible "$@"
        ;;
    exec)
        shift
        exec_command "$@"
        ;;
    logs)
        show_logs
        ;;
    stop)
        stop_container
        ;;
    clean)
        clean_all
        ;;
    help|--help|-h)
        help
        ;;
    *)
        error "Unknown command: $1"
        help
        exit 1
        ;;
esac
