Clear-Host
$binaries = Get-ChildItem -Path C:\ -Include *.exe -File -Recurse |
    Where-Object { $_.VersionInfo.FileDescription }

$binaries | Out-GridView
