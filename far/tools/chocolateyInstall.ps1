$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = 'https://www.farmanager.com/files/Far30b6161.x86.20230609.msi'
    url64bit       = 'https://www.farmanager.com/files/Far30b6161.x64.20230609.msi'
    softwareName   = 'Far Manager*'
    checksum       = 'c51eff22115f2dd241bc5cb666a093a1fe99193b77eb3b7d383d45dc67751680'
    checksumType   = 'sha256'
    checksum64     = 'd5400960604df44fc6f16c5d04b016f1df7b01c8695eaf31158aa269c6eb9b6b'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
