$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.27-26220ef4.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'ecc9b8a2bb79ab9efe2c75faff9a30e02161b25ef931f66dc4fb25182b57a404'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
