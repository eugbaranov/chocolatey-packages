$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_02_22_2.11.11-787c2a71/azure-cosmosdb-emulator-2.11.11-787c2a71.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '0b34eb120806b465477d6a88ec1672418f6cd9e3cb72dedb5dadac78929f9654'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
