$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.23-19d5c986.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'dd5e8f976f5a6693f3bbaf9cd6d64d99a0008abd34c1416a978a402c80b266b7'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
