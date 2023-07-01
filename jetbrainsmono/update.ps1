import-module au

$repo = 'JetBrains/JetBrainsMono'
$releases = "https://api.github.com/repos/$repo/releases"

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(-Url64bit\s*).+"       = "`$1'$($Latest.URL64)' ``"
            "(?i)(-Checksum64\s*).+"     = "`$1'$($Latest.Checksum64)' ``"
            "(?i)(-ChecksumType64\s*).+" = "`$1'$($Latest.ChecksumType64)' ``"
        }
    }
}

function global:au_GetLatest {
    $release = (Invoke-WebRequest -Uri "$releases/latest").Content | ConvertFrom-Json

    $url = $release.assets.browser_download_url

    @{
        URL64        = $url
        Version      = $release.tag_name.TrimStart('v')
        ReleaseNotes = $release.html_url
    }
}

Update-Package 64