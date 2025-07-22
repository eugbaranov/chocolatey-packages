$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.24-7610c980.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '2c74b0de2328017f35a205ec2d8d14f52613507da9a72a0fc5f64a78e9d887c4'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
