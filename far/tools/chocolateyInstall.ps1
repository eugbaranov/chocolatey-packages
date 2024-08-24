$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = 'https://www.farmanager.com/files/Far30b6364.x86.20240824.msi'
    url64bit       = 'https://www.farmanager.com/files/Far30b6364.x64.20240824.msi'
    softwareName   = 'Far Manager*'
    checksum       = '3c83ee49e6944baa027cd59d90d52e39b03c709cf1fe6b77bef6261d4003a2a9'
    checksumType   = 'sha256'
    checksum64     = '608af6ed1d6ff09d25077c3a7eeca0333241c7cc4e198f83db352fd554a55c1a'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
