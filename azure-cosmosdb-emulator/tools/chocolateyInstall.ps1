$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_08_12_2.14.2-ed0413c7/azure-cosmosdb-emulator-2.14.2-ed0413c7.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '0e86f0627019e3fa5a51d8e9c3c5e003d6e04d94db57be94026b609d54217553'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
