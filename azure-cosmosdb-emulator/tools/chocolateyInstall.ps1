$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_09_02_2.14.3-82f05f18/azure-cosmosdb-emulator-2.14.3-82f05f18.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'aeef8992cfcbaad4d0c758f9b2965abbc2e10888ba0946766ed9e79488283499'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
