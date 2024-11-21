
# VM Status Checker

A PowerShell script designed to monitor and log the statuses of virtual machines (VMs) in a VMware environment. The script categorizes VMs into three groups: **Powered On**, **Powered Off**, and **Deleted**.

---

## Overview

The script reads a list of VMs from a file, checks their statuses using VMware PowerCLI, and logs the results to a specified log file. It also provides categorized lists of VMs for quick review and troubleshooting.

---

## Features

- **VM Status Checks**: Identifies whether a VM is powered on, powered off, or deleted.
- **Cluster Information**: Retrieves the cluster name for existing VMs.
- **Logging**: Records results with timestamps in a log file for future reference.
- **Error Handling**: Gracefully handles missing or inaccessible VMs.

---

## Prerequisites

Ensure the following requirements are met before running the script:

1. **PowerShell Version**: PowerShell 5.1 or higher installed on your system.
2. **VMware PowerCLI**: Install the VMware PowerCLI module using the following command:
   ```powershell
   Install-Module -Name VMware.PowerCLI -Scope CurrentUser
   ```
3. **VMware Environment Access**: You need sufficient permissions to query and retrieve VM information from your VMware environment.

---

## Setup Instructions

### Step 1: Clone the Repository
Clone the repository to your local machine:
```bash
git clone https://github.com/DvirEzra/vm-status-checker.git
cd vm-status-checker
```

### Step 2: Create the VM List
Create a text file named `CheckVmList.txt` in the project directory. Add the names of the VMs you want to monitor, one per line:
```
Server1
Server2
Server3
```

### Step 3: Run the Script
Open a PowerShell terminal, navigate to the script directory, and execute the script:
```powershell
.\CheckVmStatus.ps1
```

### Step 4: Review Logs
The script writes logs to `logs/log.log`. The directory is created automatically if it doesn’t exist.

---

## Script Output

The script displays categorized lists of VMs in the terminal:

1. **Powered On VMs**: VMs that are active.
2. **Powered Off VMs**: VMs that exist but are powered down.
3. **Deleted VMs**: VMs that cannot be found in the VMware environment.

### Example Terminal Output:
```
Powered On VMs: Server1, Server3
Powered Off VMs: Server2
Deleted VMs: Server4
```

---

## Log File Details

The log file includes timestamped entries for each VM status check. Example:
```
2024-11-21 10:15:30 Server1 is PoweredOn and located in cluster ClusterA
2024-11-21 10:15:32 Server2 is PoweredOff and located in cluster ClusterB
2024-11-21 10:15:34 Server4 is Deleted (not found)
```

---

## Configuration Options

You can modify the following variables in the script to suit your environment:

- **Log File Location**: Update the `$LogFile` variable to specify a custom path for the log file.
- **VM List File Path**: Modify the `$vmlist` variable to point to your VM list file.

---

## Troubleshooting

1. **PowerCLI Connection Issues**:
   - Ensure you are connected to your VMware server by running:
     ```powershell
     Connect-VIServer -Server <Your_VMware_Server>
     ```

2. **Script Fails to Find VMs**:
   - Verify that the VM names in `CheckVmList.txt` match those in your VMware environment.

3. **Log Directory Issues**:
   - Ensure the script has write permissions in the directory where logs are being stored.

---

## Notes

- This script is designed for environments configured with VMware PowerCLI.
- Avoid uploading sensitive data (e.g., VM names or logs) to public repositories.
- Customize the script as needed for your specific requirements.

---

## Contributing

Contributions are welcome! Feel free to fork this repository, make improvements, and submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
