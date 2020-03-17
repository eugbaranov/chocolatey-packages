import-module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]serverUrl\s*=\s*)('.*')"      = "`$1'$($Latest.UrlServer)'"
            "(^[$]serverChecksum\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumServer)'"
            "(^[$]cliUrl\s*=\s*)('.*')"         = "`$1'$($Latest.UrlCli)'"
            "(^[$]cliChecksum\s*=\s*)('.*')"    = "`$1'$($Latest.ChecksumCli)'"
        }
    }
}

function global:au_BeforeUpdate() {
    $Latest.ChecksumServer = Get-RemoteChecksum $Latest.UrlServer
    $Latest.ChecksumCli = Get-RemoteChecksum $Latest.UrlCli
}

function global:au_GetLatest {
    $repo = 'Shopify/toxiproxy'
    $releases = "https://api.github.com/repos/$repo/releases"
    $release = (Invoke-WebRequest -Uri "$releases/latest").Content | ConvertFrom-Json

    $serverUrl = $release.assets | Where-Object { $_.name -eq 'toxiproxy-server-windows-amd64.exe' } | Select-Object -First 1 -ExpandProperty browser_download_url
    $cliUrl = $release.assets | Where-Object { $_.name -eq 'toxiproxy-cli-windows-amd64.exe' } | Select-Object -First 1 -ExpandProperty browser_download_url

    @{
        UrlServer      = $serverUrl
        ServerChecksum = $serverUrl
        UrlCli         = $cliUrl
        CliChecksum    = $cliUrl
        Version        = $release.tag_name.Substring(1)
    }
}

Update-Package -ChecksumFor None
