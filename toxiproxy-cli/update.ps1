import-module au

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\tools\VERIFICATION.txt" = @{
            "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
            "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
            "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix -FileNameBase 'toxiproxy-cli' }

function global:au_GetLatest {
    $repo = 'Shopify/toxiproxy'
    $releases = "https://api.github.com/repos/$repo/releases"
    $release = (Invoke-WebRequest -Uri "$releases/latest" -UseBasicParsing).Content | ConvertFrom-Json

    $url = $release.assets | Where-Object { $_.name -eq 'toxiproxy-cli-windows-amd64.exe' } | Select-Object -First 1 -ExpandProperty browser_download_url

    @{
        URL64        = $url
        Version      = $release.tag_name.Substring(1)
        ReleaseNotes = $release.html_url
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    Update-Package -ChecksumFor None
}