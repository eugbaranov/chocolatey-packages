$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/raspberrypi/rpi-imager/releases/download/v1.8.3/imager-1.8.3.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Raspberry Pi Imager'
    checksum       = 'ab1638727335cf9373ad6faa30c40b39963ccc98e3e61556999ff2b0fd8f9909'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
