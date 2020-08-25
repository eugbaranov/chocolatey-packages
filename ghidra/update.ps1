import-module au

$releases = 'https://ghidra-sre.org/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(-Url64bit\s*).+"       = "`$1'$($Latest.URL64)' ``"
            "(?i)(-Checksum64\s*).+"     = "`$1'$($Latest.Checksum64)' ``"
            "(?i)(-ChecksumType64\s*).+" = "`$1'$($Latest.ChecksumType64)' ``"
        }
    }
}

function global:au_BeforeUpdate() {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
    $Latest.ChecksumType64 = 'sha256'
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest $releases
    $latest = $download_page.links | Where-Object href -match '.zip$' | Select-Object -First 1 -Expand href
    $url = $releases + $latest
    $parts = $latest.Split('_')
    $version = $parts[1]

    @{
        URL64   = $url
        Version = $version
    }
}

Update-Package -ChecksumFor None
