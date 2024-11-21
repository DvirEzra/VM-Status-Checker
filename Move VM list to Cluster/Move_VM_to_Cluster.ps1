#Move VM list to Cluster


# Define the log file location
$LogFile = "C:\CheckVmStaus\log.log"

# Define a logging function to write messages with a timestamp (time first, then date)
function WriteLog {
    Param ([string]$LogString)
    $timeStamp = $(Get-Date -Format 'HH:mm:ss yyyy-MM-dd')
    $LogMessage = "$timeStamp $LogString"
    Add-Content $LogFile -Value $LogMessage
}

# Ensure the log directory exists
$logDir = [System.IO.Path]::GetDirectoryName($LogFile)
if (-not (Test-Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force
}

# Define the destination cluster and datastore
$destination = Get-VMHost 'YourClusterName'
$destinationDatastore = Get-Datastore 'YourDatastoreName'

# Load the list of powered-off VMs from a text file
# Each line in the text file should contain one VM name
$vmList = Get-Content -Path "C:\CheckVmStaus\CheckVmList.txt"

# Loop through each VM in the list and move it to the destination cluster and datastore
foreach ($vmName in $vmList) {
    # Check if the VM exists
    $vm = Get-VM -Name $vmName
    if ($vm) {
        try {
            # Move the VM to the specified cluster and datastore
            $vm | Move-VM -Destination $destination -Datastore $destinationDatastore -Confirm:$false
            Write-Host "VM $($vm.Name) successfully moved"
            WriteLog "VM $($vm.Name) successfully moved"
        } catch {
            Write-Host "Failed to move VM $($vm.Name): $_"
            WriteLog "Failed to move VM $($vm.Name): $_"
        }
    } else {
        Write-Host "VM $vmName not found"
        WriteLog "VM $vmName not found"
    }
}
