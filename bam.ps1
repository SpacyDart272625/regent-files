Clear-Host

# Specify the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21*1001"

try {
    # Retrieve the properties from the registry
    $mountedDevicesInfo = Get-ItemProperty -Path $registryPath -ErrorAction Stop

    # Display only the property names
    $mountedDevicesInfo | Select-Object -Property * -ExcludeProperty PS* | ForEach-Object { $_.PSObject.Properties.Name } | Out-GridView -Title "Regent USB"
}
catch {
    Write-Host "Error accessing registry path: $registryPath" -ForegroundColor Red
    Write-Host "Error Message: $_" -ForegroundColor Red
}
