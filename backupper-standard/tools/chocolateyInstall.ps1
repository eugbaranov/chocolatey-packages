$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://www2.aomeisoftware.com/download/adb/AOMEIBackupperStd.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    fileType      = 'EXE'
    url           = $url
    softwareName  = 'AOMEI Backupper Standard*'
    checksum      = '25794e087a9b65968cc66e3dba41b45b07485a7766e9db65e2c07957f2c79089'
    checksumType  = 'sha256'
    silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
