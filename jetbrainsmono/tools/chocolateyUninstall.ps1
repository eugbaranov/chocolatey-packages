$ErrorActionPreference = 'Stop'

$uninstalled = Uninstall-ChocolateyFont -Multiple
Write-Host "Uninstalled fonts: $uninstalled"
