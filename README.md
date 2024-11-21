# VMware Management Scripts

This repository contains a collection of PowerShell scripts designed to automate VMware management tasks. Each script serves a specific purpose, such as checking the status of virtual machines (VMs), powering off VMs, or moving VMs to a different cluster.

---

## Projects Overview

### 1. **Check VM Status**

This script checks the power status of a list of VMs and logs their current state (PoweredOn, PoweredOff, or Deleted if not found). It reads the list of VMs from a text file, checks if each VM is present in the system, and logs whether the VM is powered on or off.

- **Folder Location**: Check VM Status
- **Usage**: To check the status of multiple VMs and log the results.

---

### 2. **Power Off VM**

This script powers off a list of VMs. It ensures that each VM is fully powered off before confirming success. If a VM cannot be found or powered off, it logs the error. The list of VMs is read from a text file, and each VM is powered off one by one.

- **Folder Location**: Power Off VM
- **Usage**: To safely power off multiple VMs.

---

### 3. **Move VM List to Cluster**

This script moves VMs from their current location to a designated cluster and datastore. It reads the list of VM names from a text file and moves them to the specified destination cluster and datastore. The script logs the success or failure of each VM move.

- **Folder Location**: Move VM To Cluster
- **Usage**: To move VMs to a specified cluster and datastore.

---

## Setup Instructions

1. **Clone the Repository**

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/DvirEzra/VMware-Management-Scripts.git
   cd VMware-Management-Scripts
   ```

2. **Prepare the VM List**

   For each script that requires a list of VMs (`CheckVMStatus.ps1`, `PowerOffVM.ps1`, `MoveVMToCluster.ps1`), create a text file named `CheckVmList.txt` in the relevant folder. Add the VM names, one per line:

   ```
   VM1
   VM2
   VM3
   ```

3. **Script Configuration**

   - **For `MoveVMToCluster.ps1`**: Open the script and modify the following variables:
     - **`$destination`**: Specify the target cluster name.
     - **`$destinationDatastore`**: Specify the target datastore name.

4. **Run the Script**

   After setting up the files, you can run the relevant script using PowerShell:

   ```powershell
   .\CheckVMStatus\CheckVMStatus.ps1
   .\PowerOffVMs\PowerOffVM.ps1
   .\MoveVMToCluster\MoveVMToCluster.ps1
   ```

   **Note**: Ensure VMware PowerCLI is installed before running the scripts.

---

## Example Output

- **`CheckVMStatus.ps1`**:
   ```plaintext
   VM VM1 is PoweredOn and located in cluster ClusterA
   VM VM2 is PoweredOff and located in cluster ClusterB
   VM VM3 is Deleted (not found)
   ```

- **`PowerOffVM.ps1`**:
   ```plaintext
   Stopping VM: VM1
   Waiting for VM1 to shut down...
   VM VM1 turned off successfully
   ```

- **`MoveVMToCluster.ps1`**:
   ```plaintext
   VM VM1 successfully moved
   VM VM2 not found
   Failed to move VM VM3: Error message
   ```

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
