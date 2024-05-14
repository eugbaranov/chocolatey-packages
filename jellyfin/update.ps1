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
    $downloadPage = "https://repo.jellyfin.org/files/server/windows/stable/"
    $latest = (Invoke-WebRequest -Uri $downloadPage).Links | Select-Object -Last 1
    $releasePage = "$downloadPage$($latest.href)amd64"
    $release = (Invoke-WebRequest -Uri $releasePage).Links | Where-Object { $_.href -like '*_windows-x64.exe' } | Select-Object -ExpandProperty href
    $version = $release.Split('_')[1]
    $url = "$releasePage/$release"

    @{
        URL64   = $url
        Version = $version
    }
}

Update-Package 64