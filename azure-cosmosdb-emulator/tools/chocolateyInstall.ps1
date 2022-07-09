$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2022_07_07_2.14.9-3c8bff92/azure-cosmosdb-emulator-2.14.9-3c8bff92.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '475628da12b8d50485931283c927e548ed8d3f5cc8c8d62def2d5ef57aca8029'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
