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
    -Url64bit 'https://repo.jellyfin.org/files/server/windows/stable/v10.9.5/amd64/jellyfin_10.9.5_windows-x64.exe' `
    -Checksum64 'aabd7597d0e5b36d77958f6d2d221b2a2bb14e94dd9d95b317d4555a4f1a5986' `
    -ChecksumType64 'sha256' `
    -SilentArgs '/S' `
    -ValidExitCodes @(0,1) `
    -SoftwareName 'Jellyfin Server*'

CreateShortcut -Path "$ENV:Public\Desktop"
CreateShortcut -Path "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs"
