$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2022_05_08_2.14.7-c041c584/azure-cosmosdb-emulator-2.14.7-c041c584.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '250411a5a3190c6def3ac53b9bc9e3331b673b71617a63753101ade111913df6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
