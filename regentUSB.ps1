Clear-Host

$registryPath = "HKLM:\SYSTEM\MountedDevices"

try {
    $mountedDevicesInfo = Get-ItemProperty -Path $registryPath -ErrorAction Stop

    $script:Paused = $false
    $job = Start-Job -ScriptBlock {
        param($gridView)
        $gridView | Out-GridView -Title "Regent USB" -PassThru | ForEach-Object {
            Remove-Job -Job $job
            $script:Paused = $false
        }
    } -ArgumentList ( $mountedDevicesInfo | Select-Object -Property * -ExcludeProperty PS* )
    $script:Paused = $true
    while ($script:Paused) {
        Start-Sleep -Milliseconds 100
    }
}
catch {
    Write-Host "Error accessing registry path: $registryPath" -ForegroundColor Red
    Write-Host "Error Message: $_" -ForegroundColor Red
}
