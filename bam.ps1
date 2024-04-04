$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\"

try {
    $bam = Get-ItemProperty -Path $registryPath -ErrorAction Stop
    $bam | Select-Object -Property * -ExcludeProperty PS* | ForEach-Object { $_.PSObject.Properties.Name } | Out-GridView -Title "Simple bam lol" -PassThru -Wait
}
catch {
    Write-Host "Error accessing registry path: $registryPath" -ForegroundColor Red
    Write-Host "bam is disabled." -ForegroundColor Red
}
pause
