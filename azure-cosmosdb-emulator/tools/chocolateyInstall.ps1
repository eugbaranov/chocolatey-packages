$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url64bit       = 'https://cdbemulator-dmhwaeevbhd3e9f8.b02.azurefd.net/msi/pipeline/azure-cosmosdb-emulator-2.14.25-ec34375b.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '796cc49576dc22737b3b0a2b0817520b0d6d7d84ceaa3a99c6732c102f640804'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
