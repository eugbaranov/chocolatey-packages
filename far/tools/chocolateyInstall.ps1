$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = 'https://www.farmanager.com/files/Far30b6226.x86.20231214.msi'
    url64bit       = 'https://www.farmanager.com/files/Far30b6226.x64.20231214.msi'
    softwareName   = 'Far Manager*'
    checksum       = '9eb888452e98ae4e192797b284af23889688d4f75fc766836f49534948c49531'
    checksumType   = 'sha256'
    checksum64     = 'ce93dada3365be8000a409b10ea255f7b5d521bb313fcdd11cd4fe7a90dcca4f'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
