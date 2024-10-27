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
    -Url64bit 'https://repo.jellyfin.org/files/server/windows/stable/v10.10.0/amd64/jellyfin_10.10.0_windows-x64.exe' `
    -Checksum64 'c967408fca155d8367b2cff1d0bd28d8c7dea62117e4afd1a4c499e4529252c1' `
    -ChecksumType64 'sha256' `
    -SilentArgs '/S' `
    -ValidExitCodes @(0,1) `
    -SoftwareName 'Jellyfin Server*'

CreateShortcut -Path "$ENV:Public\Desktop"
CreateShortcut -Path "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs"
