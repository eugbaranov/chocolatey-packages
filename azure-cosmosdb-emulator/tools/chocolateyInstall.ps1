$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2022_01_18_2.14.5-ff900d04/azure-cosmosdb-emulator-2.14.5-ff900d04.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '3d5f23e547be192e0093278b84044ef248267bc858ab9410881fb2495564dc27'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
