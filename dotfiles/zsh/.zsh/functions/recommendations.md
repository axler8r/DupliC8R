PowerShell Function Naming Recommendations
==========================================

## INCORRECT VERBS (Not PowerShell Approved)
1. list-attribute
   - "List" is NOT an approved PowerShell verb
   - Function lists ALL attributes on a file (different from get-attribute which gets ONE specific value)
   - Recommendation: Rename to "Get-Attributes" (plural, using approved Get verb) ✓ (APPLIED)
2. optimize-gitrepository
   - "Optimize" is NOT an approved PowerShell verb
   - Recommendation: Rename to "Invoke-GitRepositoryOptimization" ✓ (APPLIED)
3. resolve-gitpathrepository
   - "Resolve" IS approved, but the name order is confusing
   - Recommendation: Rename to "Resolve-GitRepositoryPath" ✓ (APPLIED)


## CAN BE IMPROVED (APPLIED)
1. convertto-h264 / convertto-pdf
   - Correct verb, but nouns could be more descriptive
   - Recommendation: "ConvertTo-H264Video" and "ConvertTo-PdfDocument" ✓ (APPLIED)
2. format-videohorizontal
   - Recommendation: "ConvertTo-VideoHorizontal" ✓ (APPLIED)
3. get-aptpackageconent
   - TYPO: Missing 't' in "content"
   - Recommendation: "Get-AptPackageContent" ✓ (APPLIED)
4. mount-conda
   - Recommendation: "Mount-CondaEnvironment" ✓ (APPLIED)
5. reset-gnome
   - Recommendation: "Reset-GnomeSettings" ✓ (APPLIED)
6. start-dockerazcli
   - Recommendation: "Start-AzureCliContainer" ✓ (APPLIED)


## PLURAL VS SINGULAR (Based on Function Behavior)
### CORRECTED: Must Be Plural (Returns/Operates on Collections):
1. get-githubgitignores → Get-GitHubGitIgnores ✓ (returns list of all templates)
2. get-githublicenses → Get-GitHubLicenses ✓ (returns list of all licenses)
3. list-attribute → Get-Attributes ✓ (lists ALL attributes on a file)
4. get-dockerdanglingimage → Get-DanglingDockerImages ✓ (lists ALL dangling images)
5. get-dockerimage → Get-DockerImages ✓ (lists ALL installed images)
6. find-dockerimage → Find-DockerImages ✓ (searches and returns multiple matches)
7. update-dockerimage → Update-DockerImages ✓ (updates multiple images)
8. get-userfunctions → Get-UserFunctions ✓ (lists ALL user functions)
9. update-neovimplugs → Update-NeovimPlugins ✓ (updates ALL plugins)
10. get-aptuserinstalls → Get-AptUserInstalls ✓ (lists ALL user-installed packages)

### Correctly Singular (Operates on Single Item):
1. find-asdfplugin → Find-AsdfPlugin ✓ (searches for ONE plugin)
2. update-asdfplugin → Update-AsdfPlugin ✓ (updates ONE plugin)
3. get-attribute → Get-Attribute ✓ (gets ONE specific attribute value)


## CONSISTENCY ISSUES
### Inconsistent Noun Order:
1. get-dockerdanglingimage
## CONSISTENCY IMPROVEMENTS (APPLIED)
### Noun Order Fixed:
1. get-dockerdanglingimage → Get-DockerImageDangling ✓ (APPLIED)
2. resolve-gitpathrepository → Resolve-GitRepositoryPath ✓ (APPLIED)

### Compound Words Fixed:
1. get-systeminformation → Get-SystemInformation ✓ (APPLIED)
2. get-currentasdfpluginversion → Get-AsdfPluginVersion ✓ (APPLIED - "current" implied)
3. get-latestasdfpluginversion → Get-LatestAsdfPluginVersion ✓ (APPLIED)

### Abbreviations Capitalized:
1. get-aptuserinstalls → Get-AptUserInstall ✓ (APPLIED)
2. get-aptpackageconent → Get-AptPackageContent ✓ (APPLIED)
3. read-aptpackage → Read-AptPackage ✓ (APPLIED)

### Cache Naming Clarified:
1. clear-dnscache → Clear-DnsCache ✓ (APPLIED)
2. clear-fscache → Clear-FileSystemCache ✓ (APPLIED)

### Video Functions Standardized:
1. get-videoformat → Get-VideoFormat ✓ (APPLIED)
2. get-videometadata → Get-VideoMetadata ✓ (APPLIED)
3. format-videohorizontal → ConvertTo-VideoHorizontal ✓ (APPLIED)

### GitHub Functions (Verb Usage Clarified):
**Different Functions, Different Verbs** ✓ (CORRECTED):
1. show-githubgitignore → Show-GitHubGitIgnore (displays specific template content)
2. get-githubgitignores → Get-GitHubGitIgnores (retrieves list of available templates)
3. show-githublicense → Show-GitHubLicense (displays specific license content)
4. get-githublicenses → Get-GitHubLicenses (retrieves list of available licenses)

These are NOT duplicates - they serve different purposes:
- Show-* = Display formatted content of a specific item (takes parameter)
- Get-* = Retrieve list of all available items (no parameter)
All other functions use approved PowerShell verbs correctly:
- Clear, ConvertTo, Find, Get, New, Read, Remove, Set, Show, Start, Test, Update, Write

These follow the Verb-Noun convention properly.

Main issue: Inconsistent capitalization within compound nouns - PowerShell uses
PascalCase where each word component should be identifiable.
## SUMMARY
✓ All functions now use approved PowerShell verbs correctly:
- Clear, ConvertTo, Find, Get, Invoke, New, Read, Remove, Resolve, Set, Show, Start, Test, Update, Write

✓ All functions follow proper Verb-Noun convention with PascalCase capitalization

✓ Plural forms correctly applied based on actual function behavior:
  - Plural: Functions that return or operate on collections/multiple items
  - Singular: Functions that operate on a single item

✓ "List" verb eliminated and replaced with "Get" (PowerShell approved)

✓ All naming conflicts resolved

## POWERSHELL NAMING PRINCIPLES APPLIED
1. **Approved Verbs Only**: Only PowerShell-approved verbs used
2. **PascalCase**: Proper capitalization for readability (e.g., DockerImage, not Dockerimage)
3. **Semantic Plurality**: Plural nouns when returning/operating on collections
4. **Consistency**: Similar functions follow similar patterns
5. **Clarity**: Descriptive nouns that clearly indicate function purpose
