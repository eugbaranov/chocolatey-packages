Import-Module AU

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $mainPage = 'https://www.farmanager.com'

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $downloads = Invoke-WebRequest -Uri "$mainPage/download.php?l=en"

    $url32 = $downloads.Links | Where-Object { $_.href -like '*.x86.*.msi' } | Select-Object -ExpandProperty href -First 1
    $url64 = $downloads.Links | Where-Object { $_.href -like '*.x64.*.msi' } | Select-Object -ExpandProperty href -First 1

    # e.g. 'files/Far30b6161.x86.20230609.msi'
    $version = $url64.Split('/')[1].Split('.')[0].Substring(3).Replace('b', '.')
    $version = $version.Substring(0, 1) + '.' + $version.Substring(1)

    @{
        URL32   = "$mainPage/$url32"
        URL64   = "$mainPage/$url64"
        Version = $version
    }
}

Update-Package
