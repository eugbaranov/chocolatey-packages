$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/raspberrypi/rpi-imager/releases/download/v2.0.10/imager-v2.0.10.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Raspberry Pi Imager'
    checksum       = 'f5b0bd6f149274d8b92c3dbbdefa274097c9d9098dd4eb08c71b845b58995b2a'
    checksumType   = 'sha256'
    silentArgs     = '/verysilent'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
