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
