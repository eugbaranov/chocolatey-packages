$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -Url64bit 'https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip' `
    -Checksum64 '6f6376c6ed2960ea8a963cd7387ec9d76e3f629125bc33d1fdcd7eb7012f7bbf' `
    -ChecksumType64 'sha256' `
    -UnzipLocation $toolsDir

$fontFiles = Get-ChildItem $toolsDir\fonts\ttf -Recurse -Filter *.ttf -File
$installed = Install-ChocolateyFont @($fontFiles.FullName) -Multiple
Write-Host "Installed fonts: $installed"
