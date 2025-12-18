#!/bin/bash

# DE Learning Hub - Setup Script
# Automatically clones all project repositories and sets up local development environment

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
ORG_NAME="de-learning-hub"
BASE_DIR="de-learning-hub"
GITHUB_BASE_URL="https://github.com/${ORG_NAME}"

# Repositories to clone
declare -a REPOS=(
    "backend"
    "frontend"
    "infrastructure"
)

# Optional repositories (Phase 2+)
declare -a OPTIONAL_REPOS=(
    "airflow"
)

# Print colored message
print_msg() {
    color=$1
    message=$2
    echo -e "${color}${message}${NC}"
}

# Print section header
print_header() {
    echo ""
    print_msg "$BLUE" "================================"
    print_msg "$BLUE" "$1"
    print_msg "$BLUE" "================================"
    echo ""
}

# Check if git is installed
check_git() {
    if ! command -v git &> /dev/null; then
        print_msg "$RED" "❌ Git is not installed. Please install git first."
        exit 1
    fi
    print_msg "$GREEN" "✅ Git found: $(git --version)"
}

# Check if Docker is installed
check_docker() {
    if command -v docker &> /dev/null; then
        print_msg "$GREEN" "✅ Docker found: $(docker --version)"
        DOCKER_INSTALLED=true
    else
        print_msg "$YELLOW" "⚠️  Docker not found. You'll need Docker to run the services."
        DOCKER_INSTALLED=false
    fi
}

# Clone a repository
clone_repo() {
    repo_name=$1
    repo_url="${GITHUB_BASE_URL}/${repo_name}.git"

    if [ -d "$repo_name" ]; then
        print_msg "$YELLOW" "⏭ ${repo_name} already exists, skipping..."
    else
        print_msg "$BLUE" "Cloning ${repo_name}..."
        if git clone "$repo_url" "$repo_name"; then
            print_msg "$GREEN" "✓ ${repo_name} cloned successfully"
        else
            print_msg "$RED" "✗ Failed to clone ${repo_name}"
            return 1
        fi
    fi
}

# Setup environment files
setup_env_files() {
    print_header "Setting up environment files"

    # Backend .env
    if [ -f "backend/.env.example" ] && [ ! -f "backend/.env" ]; then
        print_msg "$BLUE" "Creating backend/.env from .env.example"
        cp backend/.env.example backend/.env
        print_msg "$YELLOW" "⚠ Please edit backend/.env and set your configuration"
    fi

    # Infrastructure .env
    if [ -f "infrastructure/.env.example" ] && [ ! -f "infrastructure/.env" ]; then
        print_msg "$BLUE" "Creating infrastructure/.env from .env.example"
        cp infrastructure/.env.example infrastructure/.env
        print_msg "$YELLOW" "⚠ Please edit infrastructure/.env and set your configuration"
    fi
}

# Print success message with next steps
print_success() {
    print_header "Setup Complete"

    echo ""
    print_msg "$GREEN" "All repositories have been cloned successfully!"
    echo ""
    print_msg "$BLUE" "Project structure:"
    tree -L 1 -d "$BASE_DIR" 2>/dev/null || ls -l "$BASE_DIR"
    echo ""

    print_msg "$YELLOW" "Next steps:"
    echo ""
    echo "1. Configure environment variables:"
    print_msg "$BLUE" "   cd ${BASE_DIR}/infrastructure"
    print_msg "$BLUE" "   nano .env  # or your favorite editor"
    echo ""

    if [ "$DOCKER_INSTALLED" = true ]; then
        echo "2. Start all services with Docker Compose:"
        print_msg "$BLUE" "   docker-compose up -d"
        echo ""
        echo "3. Apply database migrations:"
        print_msg "$BLUE" "   docker-compose exec backend python manage.py migrate"
        echo ""
        echo "4. Create Django superuser:"
        print_msg "$BLUE" "   docker-compose exec backend python manage.py createsuperuser"
        echo ""
        echo "5. Access the services:"
        print_msg "$GREEN" "   Frontend:  http://localhost:3000"
        print_msg "$GREEN" "   Backend:   http://localhost:8000"
        print_msg "$GREEN" "   API Docs:  http://localhost:8000/api/schema/swagger-ui/"
        print_msg "$GREEN" "   Admin:     http://localhost:8000/admin"
    else
        echo "2. Install Docker and Docker Compose"
        echo ""
        echo "3. Follow manual setup instructions in:"
        print_msg "$BLUE" "   ${BASE_DIR}/infrastructure/README.md"
    fi

    echo ""
    print_msg "$BLUE" "Documentation:"
    echo "   - Backend:        ${GITHUB_BASE_URL}/backend"
    echo "   - Frontend:       ${GITHUB_BASE_URL}/frontend"
    echo "   - Infrastructure: ${GITHUB_BASE_URL}/infrastructure"
    echo ""

    print_msg "$GREEN" "Happy coding!"
}

# Main execution
main() {
    print_header "DE Learning Hub - Setup"

    print_msg "$BLUE" "This script will clone all project repositories and set up your local environment."
    echo ""

    # Check prerequisites
    print_header "Checking prerequisites"
    check_git
    check_docker

    # Create base directory
    print_header "Creating project directory"
    if [ -d "$BASE_DIR" ]; then
        print_msg "$YELLOW" "⚠️  Directory ${BASE_DIR} already exists"
        read -p "Continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_msg "$RED" "Aborted."
            exit 1
        fi
    else
        mkdir -p "$BASE_DIR"
        print_msg "$GREEN" "✅ Created ${BASE_DIR}/"
    fi

    cd "$BASE_DIR"

    # Clone repositories
    print_header "Cloning repositories"
    for repo in "${REPOS[@]}"; do
        clone_repo "$repo"
    done

    # Ask about optional repositories
    echo ""
    print_msg "$YELLOW" "Optional repositories (Phase 2+):"
    for repo in "${OPTIONAL_REPOS[@]}"; do
        read -p "Clone ${repo}? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            clone_repo "$repo"
        fi
    done

    # Setup environment files
    setup_env_files

    # Print success message
    cd ..
    print_success
}

# Run main function
main "$@"
