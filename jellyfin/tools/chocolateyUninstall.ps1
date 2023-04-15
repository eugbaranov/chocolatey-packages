$ErrorActionPreference = 'Stop'

Remove-Item "$ENV:Public\Desktop\Jellyfin.lnk" -Force -ErrorAction SilentlyContinue
Remove-Item "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\Jellyfin.lnk" -Force -ErrorAction SilentlyContinue

if (Test-Path "$ENV:ProgramData\Jellyfin") {
    Write-Host "Jellyfin configuration and data is preserved in $ENV:ProgramData\Jellyfin. Please remove the directory manually if you no longer need it." -Foreground Magenta
}