[CmdletBinding()]
param (
    # Specifies a path to one or more locations.
    [Parameter(Mandatory = $true,
        Position = 0,
        ParameterSetName = "ByPath",
        ValueFromPipeline = $true,
        ValueFromPipelineByPropertyName = $true,
        HelpMessage = "Path(s) to file(s).")]
    [Alias("PSPath")]
    [ValidateNotNullOrEmpty()]
    [string]$FilePath,
    [Parameter(Mandatory = $false)]
    $SourceEncoding,
    [Parameter(Mandatory = $false)]
    $DestinationEncoding = (New-Object "System.Text.UTF8Encoding" @($false))
)

begin {
    if ($null -eq $SourceEncoding) {
        $SourceEncoding = [System.Text.Encoding]::GetEncoding("ibm850", [System.Text.EncoderFallback]::ExceptionFallback, [System.Text.DecoderFallback]::ExceptionFallback)
    }
    elseif ($SourceEncoding -isnot [System.Text.Encoding]) {
        $SourceEncoding = [System.Text.Encoding]::GetEncoding($SourceEncoding, [System.Text.EncoderFallback]::ExceptionFallback, [System.Text.DecoderFallback]::ExceptionFallback)
    }
    if ($null -eq $DestinationEncoding) {
        $DestinationEncoding = [System.Text.Encoding]::GetEncoding("ibm850", [System.Text.EncoderFallback]::ExceptionFallback, [System.Text.DecoderFallback]::ExceptionFallback)
    }
    elseif ($DestinationEncoding -isnot [System.Text.Encoding]) {
        $DestinationEncoding = [System.Text.Encoding]::GetEncoding($DestinationEncoding, [System.Text.EncoderFallback]::ExceptionFallback, [System.Text.DecoderFallback]::ExceptionFallback)
    }
}

process {
    $FileInfo = Get-Item $FilePath -ErrorAction Stop
    try {
        if ($VerbosePreference -ne 'SilentlyContinue') {
            Write-Verbose "Converting from $($SourceEncoding.WebName) to $($DestinationEncoding.WebName): $($FileInfo.Name)"
        }
        [string]$FileContents = [System.IO.File]::ReadAllText(
            $FileInfo.FullName,
            $SourceEncoding
        )
        [System.IO.File]::WriteAllText(
            $FileInfo.FullName,
            $FileContents,
            $DestinationEncoding
        )
    }
    catch [System.Text.DecoderFallbackException] {
        if ($WarningPreference -ne 'SilentlyContinue') {
            Write-Warning "File $FilePath is not a text file or contains invalid bytes not part of the $($SourceEncoding.WebName) encoding."
        }
    }
}