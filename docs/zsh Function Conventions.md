# Function Naming Conventions
This document describes the naming conventions used for shell functions in this
directory.

## Dual Naming Strategy
Functions use a **dual naming strategy** to balance semantic clarity with Linux
usability:
1. **Primary (Canonical) Names**: PowerShell-style with PascalCase
2. **Secondary (Symlink) Aliases**: Linux-style with lowercase-and-hyphens

### Why This Approach?
- **PowerShell names** provide semantic clarity, discoverability, and approved verb consistency
- **Linux aliases** provide familiar shortcuts, less typing, and muscle-memory compatibility
- **Symlinks** give both benefits with zero code duplication

## PowerShell Naming Rules (Primary Names)
### 1. Approved Verbs Only
Use only PowerShell-approved verbs. Common ones include:

| Verb        | Purpose            | Example                            |
|           -:|:-                  |:-                                  |
| `Clear`     | Remove or reset    | `Clear-DnsCache`                   |
| `ConvertTo` | Change format/type | `ConvertTo-H264Video`              |
| `Find`      | Search for items   | `Find-DockerImages`                |
| `Get`       | Retrieve data      | `Get-SystemInformation`            |
| `Invoke`    | Perform operation  | `Invoke-GitRepositoryOptimization` |
| `Mount`     | Attach/activate    | `Mount-CondaEnvironment`           |
| `New`       | Create new item    | `New-CondaEnvironment`             |
| `Read`      | Get input/content  | `Read-AptPackage`                  |
| `Remove`    | Delete item        | `Remove-Attribute`                 |
| `Resolve`   | Determine location | `Resolve-GitRepositoryPath`        |
| `Set`       | Establish value    | `Set-Attribute`                    |
| `Show`      | Display to user    | `Show-GitHubGitIgnore`             |
| `Start`     | Begin process      | `Start-AzureCliContainer`          |
| `Test`      | Verify condition   | `Test-SslHandshake`                |
| `Update`    | Refresh/upgrade    | `Update-DockerImages`              |
| `Write`     | Output/save data   | `Write-Executable`                 |

**Avoid non-approved verbs** like: `List`, `Optimize`, `Format`, `Print`, `Deploy`
Full list: Run `Get-Verb` or see [Microsoft Documentation](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)

### 2. PascalCase Format
- **Verb-Noun** structure: `Verb-Noun` or `Verb-AdjectiveNoun`
- **Capitalize** each word component: `Get-DockerImages` not `Get-Dockerimages`
- **No abbreviations** in primary names unless universally known: `Dns` (yes), `Sys` (no)

Examples:
```
Get-SystemInformation     ✓ (not Get-Systeminformation)
Clear-FileSystemCache     ✓ (not Clear-FSCache)
Get-DanglingDockerImages  ✓ (not Get-DockerImageDangling)
```

### 3. Plural vs Singular
Use **plural nouns** when the function returns or operates on **collections**:
```bash
Get-DockerImages          # Returns multiple images
Get-UserFunctions         # Lists all functions
Update-NeovimPlugins      # Updates multiple plugins
Get-GitHubGitIgnores      # Lists all available templates
```

Use **singular nouns** when operating on a **single item**:
```bash
Find-AsdfPlugin           # Finds ONE plugin
Update-AsdfPlugin         # Updates ONE plugin
Get-Attribute             # Gets ONE attribute value
Show-GitHubGitIgnore      # Shows ONE specific template
```

### 4. Semantic Clarity
Function names should clearly indicate what they do:
- `Get-AsdfPluginVersion` not `Get-CurrentAsdfPluginVersion` (current is implied)
- `Get-AptPackageContent` not `Get-AptPackageConent` (fix typos!)
- `ConvertTo-VideoHorizontal` not `Format-VideoHorizontal` (Format is not approved)
- `Invoke-GitRepositoryOptimization` not `Optimize-GitRepository` (Optimize not approved)

### 5. Consistent Ordering
For compound nouns, use natural/logical order:
- `Get-DanglingDockerImages` not `Get-DockerImageDangling`
- `Resolve-GitRepositoryPath` not `Resolve-GitPathRepository`
- Adjectives typically come before nouns: `Get-LatestKitty`

## Linux Alias Rules (Symlinks)
Linux-friendly symlinks should follow these patterns:

### Pattern 1: Tool-Prefixed Commands
Group related commands by tool name:
```bash
lsdocker              → Get-DockerImages
lsdocker-dangling     → Get-DanglingDockerImages
update-docker         → Update-DockerImages
find-docker           → Find-DockerImages

git-optimize          → Invoke-GitRepositoryOptimization
git-repo-path         → Resolve-GitRepositoryPath

apt-user-installs     → Get-AptUserInstalls
apt-content           → Get-AptPackageContent
```

### Pattern 2: Action-Based Shortcuts
Use familiar Linux command patterns:
```bash
# ls* prefix for listing commands
lsdocker              → Get-DockerImages
lsfunctions           → Get-UserFunctions
lsxattr               → Get-Attributes

# update-* prefix for update commands
update-asdf           → Update-Asdf
update-nvim           → Update-NeovimPlugins
update-docker         → Update-DockerImages

# find-* prefix for search commands
find-docker           → Find-DockerImages
find-asdf-plugin      → Find-AsdfPlugin
```

### Pattern 3: Memorable Shortcuts
Create short, intuitive aliases for frequently used commands:
```bash
sysinfo               → Get-SystemInformation
swapinfo              → Get-SwapUsage
flush-dns             → Clear-DnsCache
ssl-test              → Test-SslHandshake
mkexec                → Write-Executable
```

### Pattern 4: Standard Unix Conventions
Follow established Unix tool naming where applicable:
```bash
getxattr              → Get-Attribute
setxattr              → Set-Attribute
lsxattr               → Get-Attributes
rmxattr               → Remove-Attribute
```

## Alias Naming Conventions (for .zshalias)
Aliases in `.zshalias` follow the same dual naming strategy as functions, but
with a key distinction: **aliases are shortcuts to commands**, not the commands
themselves.

### Dual Alias Pattern
Define **canonical PascalCase alias first**, followed by **lowercase shortcut**:
```bash
# Pattern:
alias Canonical-Name=' command or function '
alias lowercase-shortcut=' Canonical-Name '

# Examples:
alias Get-IpAddress=' printf "%s\n" "$(curl --silent --get https://api.ipify.org)" '
alias get-ipaddress=' Get-IpAddress '

alias Start-DockerElixirLivebook=' __ax_docker_start_elixir_livebook '
alias start-dockerelixirlivebook=' Start-DockerElixirLivebook '
```

### Why This Pattern?
1. **Canonical form** - PascalCase alias is the official, documented name
2. **Backward compatibility** - Lowercase shortcuts preserve muscle memory
3. **Discoverability** - Tab completion shows PascalCase as primary
4. **Consistency** - Matches the function naming strategy
5. **Flexibility** - Easy to add multiple shortcuts to one canonical alias

### Alias Guidelines
#### 1. Follow Function Naming Rules
Aliases that expose functionality should follow the same PowerShell conventions:
- Use approved verbs (Get, Set, Update, etc.)
- Use PascalCase for canonical form
- Use plural/singular appropriately
- Be semantically clear

Examples:
```bash
alias Get-DockerDanglingVolumes=' docker volume list --quiet --filter="dangling=true" '
alias Update-GitRepositories=' parallel cd {} ";" pwd ";" git pull ... '
alias Remove-DockerDanglingImages=' docker image list ... | xargs -L1 docker rmi '
```

#### 2. Helper Function References
When aliases call helper functions, use the same dual pattern:
```bash
# Define helper function (see next section)
__ax_docker_start_azure_cli() { ... }

# Create canonical alias
alias Start-DockerAzureCli=' __ax_docker_start_azure_cli '

# Create lowercase shortcut
alias start-dockerazcli=' Start-DockerAzureCli '
```

#### 3. Short Convenience Aliases
For frequently used commands, add memorable short aliases pointing to canonical:
```bash
alias Open-KittySolarizedDark=' kitty ... '
alias open-kittysolarizeddark=' Open-KittySolarizedDark '
alias okd=' Open-KittySolarizedDark '  # Extra short convenience
```

#### 4. Legacy Compatibility
When fixing typos, keep old alias for backward compatibility:
```bash
alias Start-DockerTensorflowNotebook=' __ax_docker_start_tensorflow_notebook '
alias start-dockertensorflownotebook=' Start-DockerTensorflowNotebook '
alias start-dockertesorflownotebook=' Start-DockerTensorflowNotebook '  # Legacy typo
```

### Organization
Group related aliases together in `.zshalias`:
1. **System-level aliases** (basic utilities, file operations)
2. **Tool-specific sections** (bat, docker, eza, git, kitty, tmux, zfs)
3. **Conditional aliases** (only if tool is installed)
4. **Suffix aliases** (file associations: `-s`)
5. **Global aliases** (pipeline shortcuts: `-g`)

### Common Patterns
**System operations:**
```bash
alias Get-IpAddress=' ... '
alias get-ipaddress=' Get-IpAddress '

alias Update-System=' sudo apt update && ... '
alias update-system=' Update-System '
```

**Docker operations:**
```bash
alias Get-DockerDanglingVolumes=' docker volume list ... '
alias get-dockerdanglingvolume=' Get-DockerDanglingVolumes '

alias Remove-DockerDanglingImages=' docker image list ... | xargs ... '
alias remove-dockerdanglingimage=' Remove-DockerDanglingImages '
```

**Tool launchers:**
```bash
alias Start-DockerJupyterNotebook=' __ax_docker_start_jupyter_notebook '
alias start-dockerjupyternotebook=' Start-DockerJupyterNotebook '
```

## Helper Function Conventions
Helper functions in `.zshalias` are **private implementation details** that
support aliases. They use a distinct naming convention to clearly mark them as
internal.

### Naming Pattern
```
__ax_{namespace}_{verb}_{descriptive_name}
```

**Components:**
- `__` - Double underscore marks private/internal function (zsh convention)
- `ax` - Namespace prefix to prevent conflicts
- `{namespace}` - Tool or domain (bat, docker, zfs, etc.)
- `{verb}` - Action verb (start, invoke, format, read, remove)
- `{descriptive_name}` - Detailed description with underscores

### Rules
#### 1. All Lowercase with Underscores
Helper functions use traditional shell scripting style:
```bash
# Correct
__ax_docker_start_elixir_livebook
__ax_docker_start_azure_cli
__ax_bat_format_help
__ax_zfs_remove_snapshot

# Wrong
__ax_docker_startElixirLivebook  # No camelCase
__ax_docker_start_elixirlivebook  # Missing underscores
__AX_Docker_StartAzureCli         # No PascalCase
```

#### 2. Consistent Verb Positioning
Always use **verb-first** after namespace:
```bash
# Correct
__ax_docker_start_jupyter_notebook
__ax_docker_new_zsh_ubuntu
__ax_docker_invoke_tesseract

# Wrong
__ax_docker_jupyter_notebook_start  # Verb should come first
```

#### 3. Separate Compound Words
Use underscores between all word components:
```bash
# Correct
__ax_docker_start_elixir_livebook_cuda
__ax_docker_start_tensorflow_notebook
__ax_docker_start_azure_powershell

# Wrong
__ax_docker_start_elixirlivebookcuda    # Missing underscores
__ax_docker_start_azurepowershell        # Missing underscore
```

#### 4. Namespace Grouping
Group related helpers by namespace:
**Bat helpers:**
```bash
__ax_bat_format_help
__ax_bat_read_log
```

**Docker helpers:**
```bash
__ax_docker_start_elixir_livebook
__ax_docker_start_jupyter_notebook
__ax_docker_new_zsh_ubuntu
__ax_docker_invoke_tesseract
```

**ZFS helpers:**
```bash
__ax_zfs_remove_snapshot
__ax_zfs_list_pools
```

### Public vs Private Distinction
**Public API** (User-facing):
- Functions: `Get-UserFunctions`, `Start-AzureCliContainer` (PascalCase)
- Aliases: `Get-Help`, `Start-DockerElixirLivebook` (PascalCase canonical)
- Shortcuts: `get-help`, `start-dockerelixirlivebook` (lowercase)

**Private Implementation** (Internal):
- Helpers: `__ax_bat_format_help`, `__ax_docker_start_azure_cli` (lowercase)

This creates a clear hierarchy and makes it obvious what's part of the public
interface vs internal implementation.

### Example: Complete Pattern
```bash
# 1. Define helper function (private, lowercase)
__ax_docker_start_jupyter_notebook() {
    local __AX_NAME="jupyternotebook-$(date +%Y%m%d%H%M%S)"
    docker run \
        --name "${__AX_NAME}" \
        --publish 8888:8888 \
        quay.io/jupyter/base-notebook
}

# 2. Create canonical alias (public, PascalCase)
alias Start-DockerJupyterNotebook=' __ax_docker_start_jupyter_notebook '

# 3. Create lowercase shortcut (convenience)
alias start-dockerjupyternotebook=' Start-DockerJupyterNotebook '
```

### Benefits of This Convention
1. **Clear scope** - `__` prefix immediately identifies private functions
2. **Namespace safety** - `ax_` prevents conflicts with system functions
3. **Readable code** - Underscores make multi-word names clear
4. **Consistent pattern** - Easy to add new helpers following the template
5. **Separation of concerns** - Implementation (lowercase) vs interface (PascalCase)

## Implementation Workflow
When adding or refactoring functions:
1. **Choose appropriate PowerShell verb** from approved list
2. **Create descriptive noun** using PascalCase
3. **Determine plurality** based on function behavior (single vs collection)
4. **Test semantic clarity** - is the purpose obvious from the name?
5. **Create Linux alias(es)** using patterns above
6. **Update both scripts**:
   - Add `git mv` line to `rename-functions`
   - Add `ln -sf` line to `create-linux-aliases`

When adding or refactoring aliases:
1. **Define helper function** (if needed) using `__ax_{namespace}_{verb}_{name}`
2. **Create canonical PascalCase alias** following function naming rules
3. **Create lowercase shortcut** pointing to canonical alias
4. **Add convenience shortcuts** (optional) for frequently used aliases
5. **Document legacy aliases** when fixing typos or renaming

## File Organization
```
functions/
├── CONVENTIONS.md              # This file
├── recommendations.md          # Analysis of naming decisions
├── rename-functions            # Script to rename to PowerShell convention
├── create-linux-aliases        # Script to create Linux-style symlinks
├── Get-DockerImages            # Canonical PowerShell-named function
├── lsdocker → Get-DockerImages # Linux-style symlink
└── ...
```

## Examples of Good Naming
### Docker Operations
```bash
Get-DockerImages              # Canonical
├── lsdocker                  # Quick list
└── docker-ls                 # Alternative

Get-DanglingDockerImages      # Canonical
└── lsdocker-dangling         # Linux alias

Update-DockerImages           # Canonical
└── update-docker             # Linux alias
```

### System Information
```bash
Get-SystemInformation         # Canonical
└── sysinfo                   # Short memorable

Get-SwapUsage                 # Canonical
└── swapinfo                  # Matches Unix conventions
```

### Version Management
```bash
Find-AsdfPlugin               # Canonical (singular - finds one)
└── find-asdf-plugin          # Linux alias

Get-LatestAsdfPluginVersion   # Canonical (singular - gets one version)
└── latest-asdf-plugin        # Linux alias

Update-AsdfPlugin             # Canonical (singular - updates one)
└── update-asdf-plugin        # Linux alias
```

## Common Mistakes to Avoid
**Using non-approved verbs**
```bash
List-Attributes        # "List" is not approved → Use Get-Attributes
Optimize-Repository    # "Optimize" is not approved → Use Invoke-RepositoryOptimization
Format-Video          # "Format" is ambiguous → Use ConvertTo-VideoFormat
```

**Inconsistent capitalization**
```bash
Get-Dockerimages      # Wrong → Get-DockerImages
Get-systeminformation # Wrong → Get-SystemInformation
Get-asdfplugin        # Wrong → Get-AsdfPlugin
```

**Wrong plurality**
```bash
Get-DockerImage       # Lists multiple → Get-DockerImages
Update-NeovimPlugin   # Updates all → Update-NeovimPlugins
Get-UserFunction      # Lists all → Get-UserFunctions
```

**Unclear or abbreviated primary names**
```bash
Get-SysInfo           # Too abbreviated → Get-SystemInformation
Clear-FSCache         # Too abbreviated → Clear-FileSystemCache
Get-DanglingImg       # Too abbreviated → Get-DanglingDockerImages
```

Note: Abbreviations are fine for **Linux aliases** (`sysinfo`, `lsdocker`), but **primary names** should be clear and complete.

## References
- [PowerShell Approved Verbs](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)
- [PowerShell Naming Guidelines](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/cmdlet-development-guidelines)
- [Linux Command Naming Conventions](https://www.gnu.org/prep/standards/html_node/Command_002dLine-Interfaces.html)

## Maintenance
- Run `rename-functions` after renaming files under version control
- Run `create-linux-aliases` after creating PowerShell-named functions
- Update both scripts when adding new functions
- Keep this document synchronized with actual implementation
