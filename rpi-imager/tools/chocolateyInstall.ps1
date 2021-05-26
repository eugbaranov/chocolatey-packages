$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/raspberrypi/rpi-imager/releases/download/v1.6.2/imager-1.6.2.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Raspberry Pi Imager'
    checksum       = '6e40d3b5c001c16f20729c6a8c97a61e113686f57898be23591f3f5805b51b28'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
