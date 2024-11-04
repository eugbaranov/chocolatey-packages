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
    -Url64bit 'https://repo.jellyfin.org/files/server/windows/stable/v10.10.1/amd64/jellyfin_10.10.1_windows-x64.exe' `
    -Checksum64 'c0d7a05264793e6994303935983a9e80b46ca545659352ccfa5f7cf7bf99e9a5' `
    -ChecksumType64 'sha256' `
    -SilentArgs '/S' `
    -ValidExitCodes @(0,1) `
    -SoftwareName 'Jellyfin Server*'

CreateShortcut -Path "$ENV:Public\Desktop"
CreateShortcut -Path "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs"
