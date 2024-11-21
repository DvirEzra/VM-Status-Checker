$LogFile = "C:\CheckVmStaus\log.log"

function WriteLog {
    Param ([string]$LogString)
    $timeStamp = $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
    $LogMessage = "$timeStamp $LogString"
    Add-Content $LogFile -Value $LogMessage
}

# Ensure the log directory exists
$logDir = [System.IO.Path]::GetDirectoryName($LogFile)
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force
}

$PoweredOnList = @()
$PoweredOffList = @()
$DeletedServersList = @()
$vmlist = Get-Content -Path "C:\CheckVmStaus\CheckVmList.txt"

foreach ($Server in $vmlist) {
    $test = Get-VM -Name $Server -ErrorAction SilentlyContinue

    if ($test) {
        # If the server is in the system
        $clusterName = ($test | Get-Cluster).Name # Get the name of the cluster where the server is located
        if ($test.PowerState -eq 'PoweredOn') {
            Write-Host "$Server is PoweredOn and located in cluster $clusterName"
            WriteLog "$Server is PoweredOn and located in cluster $clusterName"
            $PoweredOnList += $Server
        } else {
            # If the server is down, add the cluster
            Write-Host "$Server is PoweredOff and located in cluster $clusterName"
            WriteLog "$Server is PoweredOff and located in cluster $clusterName"
            $PoweredOffList += $Server
        }
    } else {
        #If the server is not found, we will register it as a deleted server record
        Write-Host "$Server is Deleted (not found)"
        WriteLog "$Server is Deleted (not found)"
        $DeletedServersList += $Server
    }
}

# Output the lists for verification
Write-Host "Powered On VMs: $($PoweredOnList -join ', ')"
Write-Host "Powered Off VMs: $($PoweredOffList -join ', ')"
Write-Host "Deleted VMs: $($DeletedServersList -join ', ')"
