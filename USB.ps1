Clear-Host

# Specify the registry path
$registryPath = "HKLM:\SYSTEM\MountedDevices"

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
pause
