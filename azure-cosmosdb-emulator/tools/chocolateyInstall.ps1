$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.28-f3a3a45b.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'afbdd73aaa7dc3d3933fc7b970b22285f91fed40eefd9e3c8ed137c2f1b30f4c'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
