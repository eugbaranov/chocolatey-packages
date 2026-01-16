$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/raspberrypi/rpi-imager/releases/download/v2.0.4/imager-v2.0.4.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Raspberry Pi Imager'
    checksum       = '110f1c8a4387157cb5b68f42c692807b659fc2d32b3dfea2f9d0bca340f51785'
    checksumType   = 'sha256'
    silentArgs     = '/verysilent'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
