$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2024_03_18_2.14.17-ae439f25/azure-cosmosdb-emulator-2.14.17-ae439f25.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = 'e2915c766a02d0c0703ae12b28ef992c4f62fe33e65eb482abeeaaaf0ea85237'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
