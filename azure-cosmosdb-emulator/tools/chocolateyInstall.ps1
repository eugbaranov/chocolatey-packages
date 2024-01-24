$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2024_01_24_2.14.16-343dd460/azure-cosmosdb-emulator-2.14.16-343dd460.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '9870895021bdd6512e815666279a7d57c0be9ba5767a3340bacaf61377dc0065'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
