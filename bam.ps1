$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-*1001"

try {
    $bam = Get-ItemProperty -Path $registryPath -ErrorAction Stop
    $bam | Select-Object -Property * -ExcludeProperty PS* | ForEach-Object { $_.PSObject.Properties.Name } | Out-GridView -Title "Simple bam lol" -PassThru -Wait
}
catch {
    Write-Host "Error accessing registry path: $registryPath" -ForegroundColor Red
    Write-Host "bam is disabled." -ForegroundColor Red
}
pause
