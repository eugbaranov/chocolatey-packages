import-module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$url\s*=\s*)('.*')"       = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-WebRequest -Uri 'https://www.ubackup.com/download.html'
    $version = $release.AllElements `
        | Where-Object { $_.tagName -eq 'DIV' -and $_.innerText -like '?.?.?' } `
        | Select-Object -ExpandProperty innerHTML

    $url = 'https://www.ubackup.com/ss/download/adb/AOMEIBackupperStd.exe'

    @{
        URL32   = $url
        Version = $version
    }
}

Update-Package