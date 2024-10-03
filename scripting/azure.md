# Azure

- [Azure](#azure)
      - [Why are we working with Azure?](#why-are-we-working-with-azure)
  - [Creating a Virtual Machine](#creating-a-virtual-machine)
    - [Plan to Create a Virtual Machine on Azure: Considerations](#plan-to-create-a-virtual-machine-on-azure-considerations)
    - [Additional Notes](#additional-notes)
  - [Creating a Virtual Machine: Original notes](#creating-a-virtual-machine-original-notes)
  - [Creating a Virtual Machine: Organised notes](#creating-a-virtual-machine-organised-notes)
  - [Stopping VM](#stopping-vm)
  - [Logging into our VMs](#logging-into-our-vms)
    - [SSH command to use form anywhere:](#ssh-command-to-use-form-anywhere)
  - [Organised notes: Connecting Your Virtual Machine](#organised-notes-connecting-your-virtual-machine)


#### Why are we working with Azure?
* Your skills are transferable as things will work in a very silimar way to the other cloud providers: they just name things differently.
* Azure `CLI`: is the command line.
* `API` that's running behind everything: `Azure Resource Manager` (ARM) is the API. Thy interact with this in order to carry out their commands. 

## Creating a Virtual Machine
* make sure you have a plan before you dive in. 
* Research the default options or particular options that you want. This will affect how much the cost is. 

### Plan to Create a Virtual Machine on Azure: Considerations
`Virtual Network and Subnets`
* Define the Virtual Network (VNet) and subnets the VM will reside in.
* Ensure the network configuration aligns with your security accessibility, and resource distribution needs.

`Naming Convention`
* Establish a consistent naming convention for the VM and other associated resources (disks, NICs, public IPs).
* Example: Use prefixes or suffixes that identify the environment (e.g., prod, dev) or the purpose of the VM.

`Location and Pricing`
* Choose the Azure region that best fits your needs, keeping the following in mind:
  * Proximity to your users (to minimize latency).
  * Different regions may have different pricing for the same resources.
* Consider regions that offer specific compliance or legal requirements for your data.

`VM Size and Pricing`
* Select an appropriate VM size based on:
  * CPU cores and RAM required for the workloads.
  * Ensure the size is compatible with your performance and scalability goals.
  * Be mindful of pricing tiers—VMs come in Standard, Burstable, or Premium tiers based on compute capacity.

`Storage and Pricing`
* Determine the type of storage for your VM:
  * Standard HDD: Low cost, lower performance.
  * Standard SSD: Middle-tier cost and performance.
  * Premium SSD: Higher cost, optimized for high IOPS (Input/Output Operations Per Second).
* Factor in the costs for additional data disks and backup strategies if needed.

`Operating System and Pricing`
* Choose the Operating System (OS) based on the software you plan to run.
  * Consider whether it’s Linux (Ubuntu, Red Hat, etc.) or Windows Server.
  * Different OS options may have license fees associated with them (e.g., Windows typically incurs additional charges).
* Ensure the OS is compatible with your software and workloads.

`SSH Key Pair for Access`
* Plan how you will manage SSH keys for secure access to the VM:
  * Will the team share a common SSH key or will each user have their own key pair?
  * Consider using a secure key vault for managing SSH keys if many people need access.
* For Windows VMs, consider RDP credentials for remote access.

`Redundancy and Reliability`
* Factor in redundancy to improve the reliability of your VM:
  * Use availability sets or availability zones to ensure higher uptime and protection against failures.
  * Leverage replication options to ensure critical data is mirrored across regions or zones for disaster recovery.

`Backup and Disaster Recovery`
* Plan for backups of your VM, ensuring critical data and configurations are regularly saved.
* Consider using Azure’s backup service or recovery vault to automate backup tasks and retention policies.

### Additional Notes
* Make sure to review Azure’s pricing calculator to understand the full cost implications of your choices.
* Define clear access controls and security groups to restrict unauthorized access to the VM.
* By considering each of these aspects before creating your virtual machine, you'll ensure it is set up for your operational needs, with security, scalability, and cost-efficiency in mind.

## Creating a Virtual Machine: Original notes
1. Login to Azure. 
2. Search: Virtual Machine.
3. Create > Azure Virtual Machine
4. Enter resouce group `>` virtual machine name tech264-georgia-first-vm `>` region UK SOUTH `>` availabilty zone (no infrastructure redundancy required) (aka not fussed) `>` security type: standard `>` image: A snapshot of exact files you want to run, (what operating system do i want initially on the disk?) Everything you're going to start with on the disk, e.g., when you choose which Windows you want to install, you can choose the features you want. We've chosen: Ubuntu Pro 18.04 LTS x64 Gen2 `>` Size: Standard_B1s `>` leave on default 'SSH public key' `>` username: adminuser `>` SSH public key spurce: 'Use existing key stored in azure' `>` Stored Keys: tech264-georgia-az-key `>` Imbound port rules: SSH (22) and HTTP (80) this allows you to acces web services. 
5. Got to 'disks' tab `>` OS dist type: Standard SSD `>` 
6. Go to 'Networking' `>` VN: tech264-georgia-2-subnet-vnet `>` Subnet: public-submnet `>` Publc IP: tech264-georgia-first-vm-ip `>` Select imbound ports: leave as HTTP (80), SHH (22) (this allows all IP addresses to access your virtual machine) `>` Delete public IP and NIC when VM is deleted (you don't have to select it, but we have here) `>` 
7. Go to 'Tags' `>` Owner > Georgia > resources 13 selected (all of these will have the tag).
8. Got to 'review and create' `>` will normally get you to check your settings before you publish. 
9. Click 'create'. 


## Creating a Virtual Machine: Organised notes

1. Login to Azure.
2. Search: `Virtual Machine` on Azure portal.
3. `Create` > Azure Virtual Machine:
   - `Resource Group`: Select the appropriate resource group (**tech264**).
   - `Virtual Machine Name`: **tech264-georgia-first-vm** (ensure the name follows Azure's naming rules—typically lowercase, alphanumeric, and using hyphens).
   - `Region`: UK South (this region affects both pricing and latency, so choose a region close to your users).
   - `Availability Zone`: **No infrastructure redundancy required** (this means the VM won't be distributed across zones for redundancy, which is fine if you don’t need high availability).
   - `Security Type`: Standard.
   - `Image`: This is a snapshot of the operating system and files you want on the disk. For example, when you select an OS like Windows or Linux, you are selecting the features to be installed. We chose: **Ubuntu Pro 18.04 LTS x64 Gen2**.
   - `Size`: **Standard_B1s** (a cost-effective option for small workloads, but ensure this size meets your performance requirements). Select "see all sizes" if not seen in immediate recent.
   - `Authentication`: Leave the default option as '**SSH public key**'.
   - `Username`:  Change username to to something more secure: **adminuser**.
   - `SSH Public Key Source`: Change SSH public key source to `Use existing key stored in Azure`.  
     - `Stored Keys`: **tech264-georgia-az-key** (make sure this key is available and correctly associated with your account). Select **your** Stored key (e.g tech264..).
   - `Inbound Port Rules`: Allow **SSH (22)** and **HTTP (80)** to enable terminal access and web services.  
     - ⚠️ **Note**: Leaving SSH open to all IP addresses can pose a security risk. Consider using Network Security Groups (NSGs) to restrict access by IP range for added security.

4. Go to the '`Disks`' tab:
   - Change OS Disk type to `Standard SSD (locally redundant storage)`.
   - `OS Disk Type`: **Standard SSD** (this provides a good balance between cost and performance, but consider Premium SSD if higher IOPS is required).

5. Go to the '`Networking`' tab:
   - `Virtual Network (VNet)`: **tech264-georgia-2-subnet-vnet**.
   - `Subnet`: **public-subnet**.
   - `Public IP`: **tech264-georgia-first-vm-ip**.
   - `Inbound Ports`: Keep as **SSH (22)** and **HTTP (80)** (this allows all IP addresses to access your VM).
     - ⚠️ **Security Tip**: Be cautious about leaving SSH open to all IPs. Consider NSG rules to restrict access to trusted IP ranges.
   - Public IP and NIC: Check the box to "Delete public IP and NIC when VM is deleted" (this will save resources when the VM is removed).

6. Go to the '`Tags`' tab:
   - **Owner**: Set to **Georgia**.
   - Apply tags to the 13 selected resources (this will help organize and manage resources).

7. Go to '`Review and Create`':
   - Review your settings before publishing to ensure everything is correct.

8. Click '`Create`' to deploy the Virtual Machine.

---
## Stopping VM
* virtual machine `>` check status, if running `>` click 'stop'.

---


## Logging into our VMs

1. Click 'Start': status will change to 'Running'.
2. Click 'Connect' (the normal one).
3. It'll show you the IP address: 172.167.29.191
4. use native SSH
5. Copy and execute SSH command, SSH Command will only work if you're in your .ssh folder: (tech264-georgia-az-key) 
6. Git Bash: cd `>` cd .shh `>` ls .ssh `>` grab the key^^ `>` ssh -i ~/.ssh/id_rsa.pem adminuser@172.167.29.191 (.pem is the private padlock/key) `>` exit.
7. Are you sure? type 'yes'
8. Home directory is: adminuser@tech264-georgia-first-vm


### SSH command to use form anywhere:
1. Copy and execute SSH command:
2. ~/.ssh/tech264-georgia-az-key (the path to it). 
3. enter cd on Git Bash to go back to home directory(~)
4. paste the path for the key here: ssh -i ~/.ssh/tech264-georgia-az-key adminuser@172.167.29.191


## Organised notes: Connecting Your Virtual Machine
1. **Start** your virtual machine.
2. Navigate to "Connect" under your VM.
3. Find "Native SSH" and **select** it. A side panel should open.
4. Input `~/.ssh/` and your `private key name` into the "Copy and Execute SSH Command" line. This will output a command for us to use in our CL (We are using **GitBash**).
5. Click the copy button for the code below what was just inputted.
6. Paste this code into your **GitBash**.
7. A **warning** will come out once entered into your **GitBash**. Respond with `yes` and then it will permanently save the IP address, meaning we will not be given the warning again.
8. You can type `exit` to **logout** of the Virtual Machine.