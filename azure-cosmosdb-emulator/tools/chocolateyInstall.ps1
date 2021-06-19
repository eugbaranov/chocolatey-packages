$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_06_17_2.14.1-08dca53e/azure-cosmosdb-emulator-2.14.1-08dca53e.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '4c1e9d8edb3f5d4390a119fa4df16107b5a6e51dc3edb4fe61192c37485d5e0b'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
