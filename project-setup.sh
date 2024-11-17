#!/bin/bash

# Colors and formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Helper functions
print_step() {
    echo -e "${BLUE}==>${NC} ${BOLD}$1${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_banner() {
    clear
    echo -e "${YELLOW}"
    echo "🚀 Project Setup Assistant"
    echo "------------------------"
    echo -e "${NC}"
}

# Set up conda channels explicitly
setup_conda_channels() {
    conda config --add channels defaults > /dev/null 2>&1
}

# Main setup function
setup_project() {
    # Get project details
    print_banner
    echo "Let's set up your development environment!"
    echo
    
    # Project name
    read -p "$(echo -e ${BLUE}?${NC}) Project name: " project_name
    project_name=${project_name:-"my-project"}
    
    # Python version
    read -p "$(echo -e ${BLUE}?${NC}) Python version (default: 3.10): " python_version
    python_version=${python_version:-"3.10"}
    
    # Node.js setup
    read -p "$(echo -e ${BLUE}?${NC}) Use Node.js LTS? (Y/n): " use_node_lts
    use_node_lts=${use_node_lts:-"Y"}
    
    # Create project structure
    print_step "Creating project directory"
    project_path="/home/$USER/projects/$project_name"
    mkdir -p "$project_path"
    cd "$project_path" || exit
    print_success "Created project directory"
    
    # Git setup
    print_step "Initializing git"
    git init > /dev/null 2>&1
    cat > .gitignore << EOL
node_modules/
.env
__pycache__/
*.pyc
.DS_Store
.vscode/
.npmrc
EOL
    print_success "Initialized git repository"
    
    # Clean npm config
    if [ -f "$HOME/.npmrc" ]; then
        print_step "Cleaning npm configuration"
        mv "$HOME/.npmrc" "$HOME/.npmrc.backup"
        print_success "Backed up existing .npmrc to .npmrc.backup"
    fi
    
    # Setup conda channels
    setup_conda_channels
    
    # Conda environment
    print_step "Creating conda environment"
    conda create -n "$project_name" python="$python_version" -y
    conda init > /dev/null 2>&1
    print_success "Created conda environment: $project_name"
    
    # Setup environment scripts
    print_step "Setting up environment scripts"
    
    # Create directories
    mkdir -p ~/miniconda3/envs/"$project_name"/etc/conda/activate.d
    mkdir -p ~/miniconda3/envs/"$project_name"/etc/conda/deactivate.d
    
    # Create activation script
    cat > ~/miniconda3/envs/"$project_name"/etc/conda/activate.d/env_activate.sh << 'EOL'
#!/bin/bash

# Initialize NVM without output
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" > /dev/null 2>&1
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" > /dev/null 2>&1

# Clean npm config and set Node version silently
if [ -f "$HOME/.npmrc" ]; then
    mv "$HOME/.npmrc" "$HOME/.npmrc.temp"
fi

nvm use --lts --delete-prefix --silent > /dev/null 2>&1

# Show environment status
echo "🟢 Project Environment: $(basename $CONDA_PREFIX)"
echo "📦 Active Versions:"
echo "   • Python: $(python --version)"
echo "   • Node: $(node -v)"
echo "   • NPM: $(npm -v)"
EOL
    
    # Create deactivation script
    cat > ~/miniconda3/envs/"$project_name"/etc/conda/deactivate.d/env_deactivate.sh << 'EOL'
#!/bin/bash
if [ -f "$HOME/.npmrc.temp" ]; then
    mv "$HOME/.npmrc.temp" "$HOME/.npmrc"
fi
echo "🔴 Environment Deactivated: $(basename $CONDA_PREFIX)"
EOL
    
    # Make scripts executable
    chmod +x ~/miniconda3/envs/"$project_name"/etc/conda/activate.d/env_activate.sh
    chmod +x ~/miniconda3/envs/"$project_name"/etc/conda/deactivate.d/env_deactivate.sh
    print_success "Created environment scripts"
    
    # Node.js setup if requested
    if [[ $use_node_lts =~ ^[Yy]$ ]]; then
        print_step "Setting up Node.js"
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        nvm install --lts > /dev/null 2>&1
        nvm use --lts --delete-prefix --silent > /dev/null 2>&1
        npm init -y > /dev/null 2>&1
        print_success "Initialized Node.js environment"
    fi
    
    # Create project files
    print_step "Creating project files"
    cat > README.md << EOL
# $project_name

Project created with setup-project assistant.

## Environment Setup

\`\`\`bash
# Activate environment
conda activate $project_name

# Install dependencies
pip install -r requirements.txt
${use_node_lts:+"npm install"}
\`\`\`
EOL
    
    python -m pip freeze > requirements.txt
    print_success "Created project files"
    
    # Final message
    echo
    echo -e "${GREEN}✨ Project setup complete!${NC}"
    echo
    echo "To get started:"
    echo "  cd $project_path"
    echo "  conda activate $project_name"
    echo
    echo -e "Happy coding! 🚀"
    
    # Change back to home directory
    cd ~ || exit
}

# Run the setup
setup_project
