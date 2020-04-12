. $PSScriptRoot\..\toxiproxy-server\update.ps1

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName)-cli`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
            "(\<dependency .+?`"$($Latest.PackageName)-server`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

Update-Package -ChecksumFor None
