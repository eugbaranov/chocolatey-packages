import-module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate() {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
    $Latest.ChecksumType64 = 'sha256'
}

function global:au_GetLatest {
    $response = Invoke-WebRequest https://aka.ms/cosmosdb-emulator -MaximumRedirection 0 -ErrorAction SilentlyContinue
    $url = $response.Headers.Location
    $parts = $url.Split('-')
    $version = $parts[$parts.Count - 2]

    @{
        URL64   = $url
        Version = $version
    }
}

Update-Package -ChecksumFor 64
