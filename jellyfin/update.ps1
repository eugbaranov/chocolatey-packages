import-module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(-Url64bit\s*).+"       = "`$1'$($Latest.URL64)' ``"
            "(?i)(-Checksum64\s*).+"     = "`$1'$($Latest.Checksum64)' ``"
            "(?i)(-ChecksumType64\s*).+" = "`$1'$($Latest.ChecksumType64)' ``"
        }
    }
}

function global:au_GetLatest {
    $downloadPage = "https://repo.jellyfin.org/releases/server/windows/stable/"
    $release = (Invoke-WebRequest -Uri $downloadPage).Links | Where-Object { $_.href -like '*_windows-x64.exe' } | Select-Object -ExpandProperty href
    $version = $release.Split('_')[1]
    $url = "$downloadPage$release"

    @{
        URL64   = $url
        Version = $version
    }
}

Update-Package -Debug