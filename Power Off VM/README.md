# Power Off VMs

A PowerShell script designed to power off a list of virtual machines (VMs) in a VMware environment. The script iterates through a predefined list of VM names, gracefully shuts them down, and verifies their power-off state.

---

## Overview

This script reads VM names from an external text file, attempts to shut them down, and waits until each VM is confirmed to be powered off. If a VM cannot be found, the script provides an error message.

---

## Features

- **Automated Power-Off**: Gracefully powers off VMs without requiring manual intervention.
- **Real-Time Feedback**: Displays the shutdown progress in the terminal.
- **Error Handling**: Notifies the user if a VM is not found in the environment.

---

## Prerequisites

Before running the script, ensure the following:

1. **PowerShell Version**: PowerShell 5.1 or higher is installed.
2. **VMware PowerCLI**: Install the VMware PowerCLI module by running:
   ```powershell
   Install-Module -Name VMware.PowerCLI -Scope CurrentUser
   ```
3. **VMware Environment Access**: You must have the necessary permissions to manage VMs in your VMware environment.

---

## Setup Instructions

### Step 1: Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/DvirEzra/Vm-Status-Checker/Power Off Vm.git
cd power-off-vm
```

### Step 2: Prepare the VM List
Create a text file named `CheckVmList.txt` in the script directory. Add the names of the VMs you want to power off, one per line:
```
Server1
Server2
Server3
```

### Step 3: Run the Script
Open a PowerShell terminal, navigate to the script directory, and execute the script:
```powershell
.\PowerOffVM.ps1
```

---

## Script Details

The script performs the following steps for each VM:

1. Checks if the VM exists in the VMware environment.
2. Sends a power-off command to the VM using `Stop-VM`.
3. Waits until the VM's power state is confirmed as `PoweredOff`.
4. Logs the status of each VM in the terminal.

---

## Example Output

The script outputs real-time feedback in the terminal:

```plaintext
Stopping VM: Server1
Waiting for Server1 to shut down...
Server1 turned off successfully

Stopping VM: Server2
VM Server2 not found!
```

---

## Configuration Options

You can modify the following in the script:

- **VM List File**: Update the `$serverarray` variable to point to your custom VM list file.

---

## Notes

- This script is designed for environments with VMware PowerCLI configured.
- Ensure the VM names in the list file match exactly with the names in your VMware environment.
- Avoid uploading sensitive information, such as VM names, to public repositories.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
