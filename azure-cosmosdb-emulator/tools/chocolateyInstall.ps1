$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbemulator.azureedge.net/msi/azure-cosmosdb-emulator-2.14.20-f86d900b.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'db9d5e496c5fdae17c12c03385d2bac973da61c280023d9fdc9a6020220bee41'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
