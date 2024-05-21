$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2024_04_15_2.14.18-e2d1bbf7/azure-cosmosdb-emulator-2.14.18-e2d1bbf7.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '34d8e1968a868cebbc31d1484c473fc61d3174d6c3b9ab71d4ce94f6618d7670'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
