$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = ''
    url64bit       = 'https://cosmosdbportalstorage.azureedge.net/emulator/2020_06_10_2.11.1-01f62a95/azure-cosmosdb-emulator-2.11.1-01f62a95.msi'
    softwareName   = 'Azure Cosmos DB Emulator'
    checksum64     = '2fa092e4ad2c7f9adbd8ba57b45a05859bb8102827b1f1671580bbaea927bfd1'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
