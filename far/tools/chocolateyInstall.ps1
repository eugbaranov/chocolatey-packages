$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = 'https://www.farmanager.com/files/Far30b6446.x86.20250301.msi'
    url64bit       = 'https://www.farmanager.com/files/Far30b6446.x64.20250301.msi'
    softwareName   = 'Far Manager*'
    checksum       = '3c4f616c913908a721695d78c5ce26d08fb8781ebcfc59df593fa96dbd3c357b'
    checksumType   = 'sha256'
    checksum64     = 'f8773eb81de11c55b5a4a6860442f14e49e094ba0400ae2e72ba2453a85e2ad6'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
