$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2023_01_26_2.14.11-e4dd1b43/azure-cosmosdb-emulator-2.14.11-e4dd1b43.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '4f36fc426f6f5b2a73158ff1c502e47efbf493f5b5ae79bcf7fb5e50e332eed7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
