$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/raspberrypi/rpi-imager/releases/download/v1.8.4/imager-1.8.4.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Raspberry Pi Imager'
    checksum       = '4228546baa7d0e1a240e84b97ce7e428e5eb2783449788d3571be8d8e3f3886b'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
