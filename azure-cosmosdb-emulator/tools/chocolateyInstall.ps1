$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_01_01_2.11.10-595e6574/azure-cosmosdb-emulator-2.11.10-595e6574.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'c3deb1026c94d310cf8057ef2ec074a2226821ddbe651a774696e89249ba4e2e'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
