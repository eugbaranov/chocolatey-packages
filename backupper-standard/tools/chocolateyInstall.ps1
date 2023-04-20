$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://www.ubackup.com/ss/download/adb/AOMEIBackupperStd.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    fileType      = 'EXE'
    url           = $url
    softwareName  = 'AOMEI Backupper Standard*'
    checksum      = '80794d1f190b2087f60a9f23578cc6964ff88d990195a0b1df438cc80d079c9a'
    checksumType  = 'sha256'
    silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
