# Power off VMs

$serverarray = Get-Content -Path "C:\CheckVmStaus\CheckVmList.txt"

foreach ($Server in $serverarray) {
    $SelectedVM = Get-VM -Name $Server
    
    if ($SelectedVM -ne $null) {
        Write-Host "Stopping VM: $Server" -ForegroundColor Yellow
        Stop-VM -VM $SelectedVM -Confirm:$false
        
        do {
            Start-Sleep -Seconds 3
            Write-Host "Waiting for $Server to shut down..." -ForegroundColor Cyan
            $SelectedVM = Get-VM -Name $Server
        } until ($SelectedVM.PowerState -eq 'PoweredOff')
        
        Write-Host "$Server turned off successfully" -ForegroundColor Green
    } else {
        Write-Host "VM $Server not found!" -ForegroundColor Red
    }
}
