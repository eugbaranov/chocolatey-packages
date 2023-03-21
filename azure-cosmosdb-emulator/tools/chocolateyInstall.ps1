$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2023_03_19_2.14.12-96d780da/azure-cosmosdb-emulator-2.14.12-96d780da.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '227303fd16e1f4ed1c505c97f50e44728f31c2e68984351c0898b1f034c61810'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
