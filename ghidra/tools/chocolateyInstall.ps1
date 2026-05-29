$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -Url64bit 'https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_12.1.1_build/ghidra_12.1.1_PUBLIC_20260528.zip' `
    -Checksum64 '935d3e014cb98dbeaba7e233edff85a1510a8a5c245bdaa39c214ac815e0ff24' `
    -ChecksumType64 'sha256' `
    -UnzipLocation $toolsDir

$workdir = Get-ChildItem $toolsDir -Directory | Select -First 1 -Expand FullName
$target = Join-Path -Path $workdir -ChildPath 'ghidraRun.bat'
$icon = Join-Path -Path $workdir -ChildPath 'support/ghidra.ico'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Ghidra.lnk'
Install-ChocolateyShortcut `
    -IconLocation $icon `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

Get-ChildItem -Include '*.exe' -Path $workdir -Recurse `
    | %{ New-Item -Path "$_.ignore" -Type File | Out-Null }
