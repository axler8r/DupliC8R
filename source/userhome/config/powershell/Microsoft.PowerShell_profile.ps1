# Solarized Palette
$Base0 = "#839496"      # Darkest Background
$Base00 = "#657b83"     # Default Dark Background
$Base01 = "#586e75"     # Darkest Context
$Base02 = "#073642"     # Dark Context
$Base03 = "#002b36"     # Light Context
$Base1 = "#93a1a1"      # Lightest Context
$Base2 = "#eee8d5"      # Default Light Background
$Base3 = "#fdf6e3"      # Lightest Background
$Blue = "#268bd2"
$Cyan = "#2aa198"
$Green = "#859900"
$Magenta = "#d33682"
$Orange = "#cb4b16"
$Red = "#dc322f"
$Violet = "#6c71c4"
$Yellow = "#b58900"

$PSReadLineOptions = @{
    EditMode = "Vi"
    ViModeIndicator = "Cursor"
    BellStyle = "None"
    HistoryNoDuplicates = $True
    MaximumHistoryCount = 2048
    ViModeIndicator = "Cursor"
    Colors = @{
        "Command" = $Base01
        "Comment" = $Base0
        "ContinuationPrompt" = $Base0
        "Default" = $Base0
        "Emphasis" = $Base0
        "Error" = $Base0
        "InlinePrediction" = $Base0
        "Keyword" = $Green
        "Member" = $Base0
        "Number" = $Base0
        "Operator" = $Base0
        "Parameter" = $Cyan
        "Selection" = $Base0
        "String" = $Base0
        "Type" = $Base0
        "Variable" = $Base0
    }
}
Set-PSReadLineOption @PSReadLineOptions

oh-my-posh init pwsh --config $PROFILE/axler8r.omp.json | Invoke-Expression
