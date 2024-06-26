Import-Module AU

$repo = 'jenius-apps/nightingale-rest-api-client'
$releases = "https://api.github.com/repos/$repo/releases"

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $release = (Invoke-WebRequest -Uri "$releases/latest").Content | ConvertFrom-Json

    $url = $release.assets | Where-Object { $_.name -match '.*\.msixbundle' } | Select-Object -First 1 -ExpandProperty browser_download_url

    @{
        URL32        = $url
        Version      = $release.tag_name.TrimStart('v')
        ReleaseNotes = $release.html_url
    }
}

Update-Package