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
    -Url64bit 'https://repo.jellyfin.org/files/server/windows/stable/v10.10.7/amd64/jellyfin_10.10.7_windows-x64.exe' `
    -Checksum64 'a48c2d3764f67ec6bde9feb283bf786c4528be28e46daa6f0cc4ad5e1ee4ab89' `
    -ChecksumType64 'sha256' `
    -SilentArgs '/S' `
    -ValidExitCodes @(0,1) `
    -SoftwareName 'Jellyfin Server*'

CreateShortcut -Path "$ENV:Public\Desktop"
CreateShortcut -Path "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs"
