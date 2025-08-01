$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -Url64bit 'https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.4.1_build/ghidra_11.4.1_PUBLIC_20250731.zip' `
    -Checksum64 '59b657c39c2113d65e591c1087b77d85f6f7a11e97f2f4a0c9e7188510d07ea0' `
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
