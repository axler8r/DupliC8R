# Changelog


## 4.0.4
**2024-04-22**

### Bug Fixes
+ Fix missing sandbox
+ Resolve docker file location

### New & Updated Documentation
+ Add test documentation
+ Add post install section
+ Allign install document with the truth

### New & Updated Features
+ Add local test container startup script
+ Add remote test container startup script
+ Add local testing functionality
+ Remove redundant environment variable
+ Rename test image

### Refactor
+ Add source directory
+ Add documentation directory
+ Update artefacts to reflect refactoring

### Stylistic & Idiomatic Updates
+ Arange function order
+ Declare project file types


## 4.0.3
**2024-04-18**

### Bug Fixes
+ Format code to pass linting

### New & Updated Documentation
+ Simplify readme

### New & Updated Features
+ Add apt package
+ Add help function
+ Add helper functions
+ Add icon update functions
+ Add test functions
+ Add trace functionality
+ Simplify test container
+ Update install logic

### Stylistic & Idiomatic Updates
+ Add file type definitions to project file
+ Add ignore list to project file
+ Align line continuation characters
+ Aply observability principles
+ Apply idomatic code patterns
+ Remove redundant code


## 4.0.2
**2024-04-15**

### Refactor
+ Replace install script


## 4.0.1
**2024-04-15**

### New & Updated Features
+ Add installation cli arguments
+ Add helper function section
+ Update install function
+ Update snap package list
+ Update installation function

### Refactor
+ Rename tmux configuration file

### Stylistic & Idiomatic Updates
+ Format flag sections
+ Format install candidates
+ Format install commands
+ Format script variables
+ Format variable names
+ Order helper functions
+ Order install functions
+ Remove redundant comments


## 4.0.0
**2024-04-13**

### BREAKING CHANGES
+ **BREAKING!!** New install script (`bin/install2`)
    > Replace most symlinks (`ln`) with files (`install`)
+ Exisiting install script will be deprecated in a future release

### New & Updated Features
+ Add Elixir `ctag` classes
+ Add histoty ignore functionality
+ Add Julia notebook functionality
+ Add NeoVim NERDTree toggle
+ Add Snap installation functionality
+ New helper function for list processing
+ New NeoVim spelling toggle
+ Update Julia prompts
+ Update package list
+ Update `pip` package list
+ Update NeoVim plugin list

### Stylistic & Idiomatic Updates
+ Apply function naming conventions to `bin/install2`
+ Apply standard formatting to `bin/install2`
+ Correct spelling error
+ Sort and organize extension list in `homedir/config/nvim/init.vim`
+ Update ANSI color codes to 256 color in `homedir/dircolors`


## 3.3.0
**2024-01-23**

### Bug Fixes
+ Correct variable expansion error
+ Correct incorrect kiTTY desktop file paths
+ Correct missing utf-8 character
+ Deprecate current asdf commands completion

### New & Updated Documentation
+ Simplify readme
+ Remove redundant documentation
+ Update install instructions

### New & Updated Features
+ New `development` install option
+ New allignment option for `EasyAlign` shell continuation
+ New fzf completion functionality
+ New shellcheck functionality
+ New snap application icon update scripts
+ New tmux aliases
+ New zsh command ignore functionality
+ Update EDITOR and VISUAL variables
+ Update application completion functionality
+ Update install function
+ Update pip install function
+ Update taskwarrior color scheme
+ Update vscode user settings

### Deprecated & Retired Features
+ Deprecate command ignore functionality
+ Retire install script logging
+ Retire unused functionality

### Stylistic & Idiomatic Updates
+ Apply shellcheck recommendations


## 3.2.2
**2023-12-20**

### New & Updated Features
+ New ctrl+r install function
+ New remove history function
+ New zsh completion configuration
+ Update zsh command ignore configuration
+ Update taskwarrior theme
+ Update taskwarrior configuration
+ Update font install function

### Stylistic & Idiomatic Updates
+ Apply naming convention


## 3.2.1
**2023-12-16**

### New & Updated Features
+ Update install script


## 3.2.0
**2023-12-11**

### New & Updated Features
+ New vscode settings file
+ New open kitty terminal aliases
+ New z-jump-around functionality
+ New install script logging

### Deprecated & Retired Features
+ Deprecate java path check
+ Retire symlink function
+ Retire redundant logging messages
+ Retire redundant shell configurations

### Stylistic & Idiomatic Updates
+ Standardise changelog item descriptions
+ Standardise variable expansion

### New & Updated Documentation
+ Update install script path


## 3.1.0
**2023-12-01**

### New & Updated Features
+ New extended installation functions
    + New minimal install option
    + New `kitty` install function
    + New `docker` engine install function
    + New GNU `parallel` install function
    + New font install function
    + New Numix Square Icons install function
    + New backup existing configuration function
+ New tmux split window alias
+ New git cliff configuration
+ New vscode configuration
+ Update shell installation function

### New & Updated Documentation
+ New documentation (doc) directory
    + New post install instructions
+ Update README.md
+ Update CHANGELOG.md

### Refactorings
+ Move install script to bin directory

### Meta Files
+ New `.gitignore` file


## 3.0.0
**2023-11-18**

### New & Updated Features
+ New installation script
+ New `zsh` configuration files
+ Update `nvim` configuration file
+ Update `tmux` configuraiton file


## 2.x
**©2017 to ©2021**

### New & Updated Features
+ New `zsh`
+ New `kitty`
+ New `nvim`
+ New `nvim` plugin manager
+ New PowerShell (`pwsh`)
+ New `docker`
+ New `asdf`


## 1.x
**©2014 to ©2017**

### New & Updated Features
+ New Powerline for `fish`, `bash`, `vim` and `tmux`
+ New Spacemacs
+ New Git
+ New Solarized Color Theme
