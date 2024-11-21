## Move VM List To Cluster

A PowerShell script for automating the migration of virtual machines (VMs) to a specified cluster and datastore in a VMware environment. The script reads a list of VM names from an external file, checks their existence, and moves them to the designated location.

---

## Overview

This script simplifies the process of migrating multiple VMs by automating the move operation to a specified destination cluster and datastore. Logs are generated for each operation, providing visibility into successful and failed migrations.

---

## Features

- **Automated VM Migration**: Moves VMs to a specific cluster and datastore.
- **Error Handling**: Logs errors for VMs that fail to migrate.
- **Real-Time Feedback**: Provides terminal output during the operation.
- **Logging**: Saves detailed logs with timestamps for every action.

---

## Prerequisites

Before using this script, ensure the following:

1. **PowerShell Version**: PowerShell 5.1 or higher is installed.
2. **VMware PowerCLI**: Install the VMware PowerCLI module by running:
   ```powershell
   Install-Module -Name VMware.PowerCLI -Scope CurrentUser
   ```
3. **VMware Environment Access**: Ensure you have the necessary permissions to perform VM operations (e.g., moving VMs).
4. **Valid Destination Configuration**:
   - Update the `$destination` variable to the target cluster.
   - Update the `$destinationDatastore` variable to the appropriate datastore.

---

## Setup Instructions

### Step 1: Prepare the VM List
Create a text file named `CheckVmList.txt` in the script directory. Add the names of the VMs you want to move, one per line:
```
VM1
VM2
VM3
```

### Step 2: Update the Script Configuration
Modify the following variables in the script:
- **`$destination`**: Replace `'YourClusterName'` with your target cluster name.
- **`$destinationDatastore`**: Replace `'YourDatastoreName'` with your datastore name.

### Step 3: Run the Script
Open a PowerShell terminal, navigate to the script directory, and execute the script:
```powershell
.\Move_VM_To_Cluster.ps1
```

---

## Script Details

The script performs the following steps:

1. Reads the VM names from `CheckVmList.txt`.
2. Checks if each VM exists in the VMware environment.
3. Moves the VM to the specified cluster and datastore.
4. Logs the status of each operation to `log.log`.

---

## Example Output

Terminal Output:
```plaintext
VM VM1 successfully moved
VM VM2 not found
Failed to move VM VM3: Error message
```

Log File (`log.log`):
```plaintext
10:15:30 2024-11-21 VM VM1 successfully moved
10:15:35 2024-11-21 VM VM2 not found
10:15:40 2024-11-21 Failed to move VM VM3: Error message
```
