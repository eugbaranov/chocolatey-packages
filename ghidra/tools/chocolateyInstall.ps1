$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage `
    -PackageName $env:ChocolateyPackageName `
    -Url64bit 'https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.4.2_build/ghidra_11.4.2_PUBLIC_20250826.zip' `
    -Checksum64 '795a02076af16257bd6f3f4736c4fc152ce9ff1f95df35cd47e2adc086e037a6' `
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
