$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.24-7610c980.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '81f2dfea714819ddf98eafaa3cc145857d3a7ee8ef31f373a11600c41eef786d'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
