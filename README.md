# Project Environment Setup Assistant

A personal tool I developed to help manage my Python and Node.js development environments. This script automates the setup process for new projects, helping me maintain consistent environments and avoid common setup issues.

## Why I Made This

As a student working with both Python and Node.js, I kept running into issues:
- Messy global Node.js installations
- Inconsistent conda environments
- Time wasted on repetitive setup tasks
- Environment conflicts between projects

This script helps me start new projects with a clean, isolated environment.

## What It Does

1. Creates project directory structure
2. Sets up a conda environment with specified Python version
3. Configures Node.js (if needed) using nvm
4. Creates activation/deactivation scripts
5. Initializes git with a comprehensive .gitignore
6. Sets up basic project files

## Real Setup Example

```bash
🚀 Project Setup Assistant
------------------------
Let's set up your development environment!

? Project name: sdbm3_dev
? Python version (default: 3.10): 3.12
? Use Node.js LTS? (Y/n): y

==> Creating project directory
✓ Created project directory
==> Initializing git
✓ Initialized git repository
==> Creating conda environment
✓ Created conda environment: sdbm3_dev
==> Setting up environment scripts
✓ Created environment scripts
==> Setting up Node.js
✓ Initialized Node.js environment
==> Creating project files
✓ Created project files
```

## Current Limitations

- Sometimes requires manual cleanup if interrupted
- Node.js npm config can be finicky
- Limited to basic project structure
- Doesn't handle complex dependencies
- No project templates yet (see future plans)

## Installation

```bash
# Clone the repository
git clone https://github.com/VindiceCode/create-project-cli

# Make script executable
chmod +x setup-project.sh

# Optional: Add to your path
echo 'alias create-project="~/path/to/setup-project.sh"' >> ~/.zshrc
source ~/.zshrc
```

## Usage

```bash
./setup-project.sh
# OR if aliased
create-project
```

## What Gets Created

```
your-project/
├── .git/
├── .gitignore (comprehensive)
├── src/
│   └── __init__.py
├── tests/
│   └── __init__.py
├── requirements.txt
└── README.md
```

Plus:
- Conda environment with specified Python version
- Node.js setup (if selected)
- Environment activation scripts

## Development Notes

This is a work in progress. I developed it through several iterations, fixing issues like:
- npm configuration conflicts
- conda activation problems
- environment cleanup needs
- script interruption handling

## Future Plans

Planning to add:
- Project templates (see [project_templates.md](project_templates.md))
- Better error handling
- Configuration file support
- More development tools integration

## Prerequisites

- conda installed
- nvm installed
- git installed
- Linux/Unix environment

## Problems It Solves

1. Ensures clean, isolated environments
2. Handles npm/Node.js version management
3. Creates consistent project structures
4. Saves setup time
5. Prevents "works on my machine" issues

## License

MIT License

---

This is a learning project. Feel free to suggest improvements or report issues.
