$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2021_06_15_2.14.0-6822d34e/azure-cosmosdb-emulator-2.14.0-6822d34e.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '805baa1d1bd52f6558d4b884ccc397d7e5d835b42ef39cc7908fc6c5c7702ef7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
