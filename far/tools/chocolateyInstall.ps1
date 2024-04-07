$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'msi'
    url            = 'https://www.farmanager.com/files/Far30b6300.x86.20240407.msi'
    url64bit       = 'https://www.farmanager.com/files/Far30b6300.x64.20240407.msi'
    softwareName   = 'Far Manager*'
    checksum       = 'ed28ab359bef9adce89a06660d04dcba981d8479fcde03db95214e9a6085e66f'
    checksumType   = 'sha256'
    checksum64     = 'bb54ecf43a539dac9b0c4eb0b95b93b54547036e5d25ac6059eaa2cea26c1f71'
    checksumType64 = 'sha256'
    silentArgs     = '/qn /norestart'
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
