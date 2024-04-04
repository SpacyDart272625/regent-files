$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-*1001"

try {
    $bam = Get-ItemProperty -Path $registryPath -ErrorAction Stop
    $bam | Select-Object -Property * -ExcludeProperty PS* | ForEach-Object { $_.PSObject.Properties.Name } | Out-GridView -Title "Simple bam lol" -PassThru -Wait
    
    # Loop to continuously check if GridView window is open
    while ($true) {
        $gridViewOpen = Get-Process | Where-Object { $_.MainWindowTitle -eq "Simple bam lol" }
        if ($gridViewOpen) {
            Start-Sleep -Milliseconds 500  # Sleep for a short duration before checking again
        }
        else {
            break  # Break the loop if GridView window is closed
        }
    }
}
catch {
    Write-Host "Error accessing registry path: $registryPath" -ForegroundColor Red
    Write-Host "Error Message: $_" -ForegroundColor Red
}
