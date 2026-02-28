[CmdletBinding()]
param (
)

begin {
    $SourceDirectory = Join-Path -Resolve $PSScriptRoot ".."
}

process {
    [string[]]$IgnoreFiles = "README.md",
    "LICENSE.md",
    ".editorconfig",
    ".gitignore",
    "CONQUER.ICO",
    "REG_ICON.ICO",
    "CONQUER.IDE"
    Get-ChildItem -File -LiteralPath $SourceDirectory |
    Where-Object -Property Name -NotIn $IgnoreFiles |
    & "$PSScriptRoot\ConvertFileEncoding.ps1"
}