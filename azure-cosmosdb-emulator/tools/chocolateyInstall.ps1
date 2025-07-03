$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.23-fc82dff5.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'bfba892c3b9e27093a6aa36cd3c447d812ca32d6a4361db64e753a63c90c2766'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
