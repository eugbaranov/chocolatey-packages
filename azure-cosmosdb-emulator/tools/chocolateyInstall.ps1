$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2024_05_06_2.14.19-5e444ea8/azure-cosmosdb-emulator-2.14.19-5e444ea8.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'd21a0476b7f3439319be6a1060935e7c865fefa87c47943c9a6d595137703f49'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
