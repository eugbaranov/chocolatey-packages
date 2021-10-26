$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_10_22_2.14.4-191a0f77/azure-cosmosdb-emulator-2.14.4-191a0f77.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'fe73c91f44c55149cb5d82fca1e8144cc915ffc914d4d52ec1d6da7413ff60aa'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
