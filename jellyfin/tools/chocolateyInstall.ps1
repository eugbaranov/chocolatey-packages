$ErrorActionPreference = 'Stop'

function CreateShortcut {
    param([String] $Path)

    $shortcutArgs = @{
        shortcutFilePath = "$Path\Jellyfin.lnk"
        targetPath       = 'http://localhost:8096'
        iconLocation     = "$ENV:ProgramFiles\Jellyfin\Server\jellyfin-web\favicon.ico"
    }

    Install-ChocolateyShortcut @shortcutArgs
}

Install-ChocolateyPackage `
    -PackageName $env:ChocolateyPackageName `
    -FileType 'EXE' `
    -Url64bit 'https://repo.jellyfin.org/files/server/windows/stable/v10.9.6/amd64/jellyfin_10.9.6_windows-x64.exe' `
    -Checksum64 'c03d10941a7dba422284bbbf643c149d9e6a0557cadc8dc24394198ba8d690ed' `
    -ChecksumType64 'sha256' `
    -SilentArgs '/S' `
    -ValidExitCodes @(0,1) `
    -SoftwareName 'Jellyfin Server*'

CreateShortcut -Path "$ENV:Public\Desktop"
CreateShortcut -Path "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs"
