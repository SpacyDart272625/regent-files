Clear-Host

$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-*1001"

try {
    $bamSettings = Get-ItemProperty -Path $registryPath -ErrorAction Stop

    $script:Paused = $false
    $job = Start-Job -ScriptBlock {
        param($bamSettings)
        $bamSettings | Out-GridView -Title "Regent BAM" -PassThru | ForEach-Object {
            Remove-Job -Job $job
            $script:Paused = $false
        }
    } -ArgumentList $bamSettings
    $script:Paused = $true
    while ($script:Paused) {
        Start-Sleep -Milliseconds 100
    }
}
catch {
    Write-Host "Error accessing registry path: $registryPath" -ForegroundColor Red
    Write-Host "Error Message: $_" -ForegroundColor Red
}

