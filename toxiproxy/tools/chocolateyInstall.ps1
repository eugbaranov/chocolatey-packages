$ErrorActionPreference = 'Stop'

$packageName = $env:ChocolateyPackageName
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$serverUrl = 'https://github.com/Shopify/toxiproxy/releases/download/v2.1.4/toxiproxy-server-windows-amd64.exe'
$serverChecksum = '2190b6d75570dc3b9bd5c026467c33b3f8811151a9022393666af0eaa6fda315'
$cliUrl = 'https://github.com/Shopify/toxiproxy/releases/download/v2.1.4/toxiproxy-cli-windows-amd64.exe'
$cliChecksum = '1184dfd205f3ec1bd56172313265ed499e708c25dc2e41b1c332a35e3ee7a4db'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\toxiproxy-server.exe" `
    -Url64bit $serverUrl -Checksum64 $serverChecksum -ChecksumType64 Sha256

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$toolsDir\toxiproxy-cli.exe" `
    -Url64bit $cliUrl -Checksum64 $cliChecksum -ChecksumType64 Sha256
