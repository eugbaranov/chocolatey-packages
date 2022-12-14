$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://www2.aomeisoftware.com/download/adb/AOMEIBackupperStd.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    fileType      = 'EXE'
    url           = $url
    softwareName  = 'AOMEI Backupper Standard*'
    checksum      = 'f0728cf53792980716e7a34f28d5e22a489cb3b7816ae96462695cf47411af2d'
    checksumType  = 'sha256'
    silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
