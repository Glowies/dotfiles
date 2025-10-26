function Ensure-Link {
    param (
        [Parameter(Mandatory = $true)]
        [string]$LinkPath,

        [Parameter(Mandatory = $true)]
        [string]$TargetPath
    )

    if (Test-Path $LinkPath) {
        Remove-Item $LinkPath -Recurse -Force
    }

    Write-Host "Creating junction: $LinkPath → $TargetPath"
    New-Item -ItemType Junction -Path $LinkPath -Value $TargetPath | Out-Null
}


 
# if ($PSVersionTable.PSVersion.Major -Le 5 -Or $isWindows) {
#     return
# }

$target = Join-Path $env:USERPROFILE ".config\rio"
$link   = Join-Path $env:LOCALAPPDATA "rio"

Ensure-Link -LinkPath $link -TargetPath $target
