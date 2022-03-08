$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2022_03_07_2.14.6-68d4ca59/azure-cosmosdb-emulator-2.14.6-68d4ca59.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '34c528f94882251a9d0a72238b4ad67c3283030423d3749d05dadf4dffddaaee'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
