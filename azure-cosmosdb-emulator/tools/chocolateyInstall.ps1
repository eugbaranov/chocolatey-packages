$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_04_22_2.11.13-edae671a/azure-cosmosdb-emulator-2.11.13-edae671a.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '8834074e8da41db142a464716f481956874ce082e3d7bbf8bd6f9867f89bd18a'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
