Clear-Host
$exeFiles = Get-ChildItem -Path C:\ -Include *.exe -File -Recurse
$binaries = $exeFiles | Where-Object { $_.VersionInfo.FileDescription -ne $null }
$binaries | Out-GridView
