# My notes:
** more details underneath daily notes.

- [My notes:](#my-notes)
- [Azure VM Labelling and Networking](#azure-vm-labelling-and-networking)
  - [Azure VM Labeled Diagram](#azure-vm-labeled-diagram)
  - [Creating an Azure Test VNet](#creating-an-azure-test-vnet)
  - [Deleting an Azure VNet](#deleting-an-azure-vnet)
  - [Creating Our Actual VNet](#creating-our-actual-vnet)
    - [Requirements:](#requirements)
    - [Steps to Create Subnets:](#steps-to-create-subnets)
  - [Creating an SSH Key Pair](#creating-an-ssh-key-pair)
    - [Steps to Generate an SSH Key Pair:](#steps-to-generate-an-ssh-key-pair)
    - [Step 2: Copy the Public Key](#step-2-copy-the-public-key)
    - [Step 3: Add the Public Key to Azure](#step-3-add-the-public-key-to-azure)
    - [Step 4: Test SSH Connection](#step-4-test-ssh-connection)
  - [Planning and Creating a Virtual Network (VNet) in Azure](#planning-and-creating-a-virtual-network-vnet-in-azure)
    - [Why create a VNet?](#why-create-a-vnet)
    - [Steps to Create a VNet in Azure:](#steps-to-create-a-vnet-in-azure)
    - [What Information Do You Need to Plan a VNet?](#what-information-do-you-need-to-plan-a-vnet)


# Azure VM Labelling and Networking

## Azure VM Labeled Diagram
- Create your own labeled diagram to understand how virtual machines, networks, and security groups interact.
---

## Creating an Azure Test VNet

Create a Virtual Network (VNet) on Azure for testing purposes:
* portal.azure.com

1. Search for **"Virtual Network"** on the Azure Portal.
2. Click **Create**.
3. You only have access to the **"tech264"** resource group.
4. Name your VNet using the naming convention, for example: **tech264-georgia-vnet**.
5. Add your **owner tag** as a key to identify the creator.
6. Click **Review + Create** to proceed.
7. Once deployment is complete, your VNet will be created.
8. You will only see one resource (the VNet), but you can add more resources later.
9. Go to the resource to view its details.

---

## Deleting an Azure VNet

To delete a Virtual Network:

1. Search for **"Resource Groups"** in the Azure Portal.
2. You will see everything in the resource group.
3. Click into the resource group and select the VNet you want to delete.
4. Click the three dots at the top right and select **Delete**, but **do not delete the entire resource group**.

---

## Creating Our Actual VNet

Creating a Virtual Machine (VM) inside a Virtual Network (VNet). A VM is essentially a computer hosted in the cloud that we can access from our local machines.

### Requirements:
- The VM must reside in a **subnet** within a VNet. The VNet is a logical construct in the cloud to manage IP addressing and subnets.
- The **VNet (tech264-georgia-2-subnet-vnet)** has a CIDR block of `10.0.0.0/16`, which gives around **65,000 IP addresses**.
- `CIDR` block: used to represent a range of IP addresses.
- `CIDR` (Classless Inter-Domain Routing) blocks define the size of address ranges within a network.

### Steps to Create Subnets:
1. **Public Subnet**: Accessible by anyone. The resources (like VMs) can be directly accessed from the internet, often by associating a public IP.
   - **CIDR block**: `10.0.2.0/24`
   - This range provides **256 IP addresses**.
   
2. **Private Subnet**: Restricted, more secure subnet. Typically does not allow direct access from the internet. It is usually secured and can only be accessed through a VPN, VNet peering, or other internal methods.
   - **CIDR block**: `10.0.3.0/24`
   
3. Make sure to adjust the CIDR blocks accordingly.
   - The CIDR blocks must be chosen carefully to ensure non-overlapping IP ranges
   - Each subnet must have its own unique, non-overlapping CIDR range within the parent VNet CIDR block.
   
4. Only change the **IPv4** addresses (do not touch IPv6).

5. Add the **owner tag** to identify yourself as the creator.
   - `Tags` help manage resources by identifying ownership, environment, or purpose, especially in large cloud deployments.
   - aka, they are used to group things together. 

---

## Creating an SSH Key Pair

To securely access your Azure VM, you will need to create an SSH key pair. The **private key** will stay on your local machine, while the **public key** will be uploaded to Azure.
* .pem key = PRIVATE (also .ssh folder). A private key when generated yourself: doesn't have any extension. KEEP NO WHERE NEAR GIT REPOs. NEVER INITIALISE. 
* 

### Steps to Generate an SSH Key Pair:

1. Open **Git Bash** (or terminal) on your local machine.
2. Make sure you are in your home directory (e.g., `C:/Users/your-username`).
3. Create an `.ssh` folder if it doesn't exist:
   ```bash
   mkdir .ssh```
4. Change directory into your .ssh folder: cd `.shh`
5. Generate the SSH key pair using this command: `ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
   * -t rsa: Specifies that the type of key is RSA.
   * -b 4096: Sets the key to be 4096 bits long (high security).
   * -C: Adds a comment, in this case, your email address.
6. When prompted, hit Enter to accept the default filename (or you can specify a name like tech264-anjy-az-key).
7. Press Enter again if you don't want to use a passphrase.
8. After generating, the key pair will be stored in two files:
   * Private key: tech264-georgia-az-key
   * Public key: tech264-georgia-az-key.pub
9. To view the public key, `run:cat tech264-georgia-az-key.pub`
10. Copy the entire public key (starting from ssh-rsa and ending with your email address).

### Adding the Public Key to Azure:
1. In the Azure Portal, search for SSH keys.
2. Create a new key and name it exactly as you did on your local machine, for example: tech264-anjy-az-key.
3. Paste the public key you copied from the local machine.
4. Add the owner tag.
5. Click Create to save the SSH key in Azure.

With these instructions, you can set up and manage virtual networks and secure access to your virtual machines on Azure.






# Architecture of a Virtual Machine
* `A Virtual Machine` (VM) is like a pretend computer running inside your real computer. Imagine you have a Windows computer, but you want to run a Linux operating system on it without buying a new computer. That's where a VM comes in — it lets you create a "fake" Linux computer inside your Windows computer.
* Consists of several key components that work together to emulate a physical computer. 

# Diagram

** image won't insert: insert at a later date.

1. Region (physically in the world).
2. Resource Group.
3. Virtual Network (VNet).
4. Subnet.
5. Virtual machine.
6. Disk (of machine).
7. Network Interface Controller (NIC).
8. Public IP.
9. Network Security Group (NSG) aka, like a firewall.
10. NSG rule - allow HTTP.
11. NSG rule - allow SSH.
12. SSH Key.

## Steps to Create a New SSH Key Pair and Add the Public Key to Azure
SSH keys are like a pair of locks and keys that let you securely log in to a server without needing a password. You create the pair on your computer and then put the public "lock" on the server so you can access it with your private key.

### Step 1: Generate an SSH Key Pair on Your Local Computer
1. Open a terminal (if you're on Linux or macOS) or Git Bash/PowerShell (if you're on Windows).
2. Type this command to create a new key pair:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
   * This means you're creating a strong key (`-t rsa`), making it 4096 bits (`-b 4096`), and adding a comment with your email address (`-C`).
3. You'll be asked where to save the key. Just press Enter to use the default location (it will be saved in the `.ssh` folder in your home directory).
4. It will also ask if you want a password for the key. You can press Enter if you don't want a password, or enter one for extra security.

### Step 2: Copy the Public Key
1. To see your public key, run this command:
```bash
cat ~/.ssh/id_rsa.pub
```
2. Copy the entire output (this is your public key).

### Step 3: Add the Public Key to Azure
1. Log in to the Azure Portal.
2. Go to Virtual Machines and choose the VM you want to access.
3. In the Settings, look for Reset Password, and select SSH public key as the mode.
4. Paste your public key into the field and save. 

### Step 4: Test SSH Connection
1. To log in to your Azure VM using your private key, run this command:
```bash
ssh -i ~/.ssh/id_rsa username@vm_ip_address
```
   * (Replace username with your Azure VM username and vm_ip_address with the public IP of your VM.)

## Planning and Creating a Virtual Network (VNet) in Azure
* A `Virtual Network` (VNet) is like a private network in the cloud, where you can place and connect your virtual machines securely.

### Why create a VNet?
* `Security`: You can control which machines or services can communicate within your VNet and with the internet.
* `Private Communication`: Machines inside the VNet can talk to each other without needing to go through the internet.
* `Custom IP Addressing`: You get to decide how IP addresses are assigned inside your network.

### Steps to Create a VNet in Azure:
1. Log in to Azure Portal.
2. Click on Create a Resource and search for Virtual Network.
3. Set up the VNet by entering details like:
   * Name: A unique name for your network.
   * Region: Choose where in the world you want your network.
   * Address Space: Think of this as the "range" of IP addresses your network will use (e.g., 10.0.0.0/16).
4. `Subnets`: Break the network into smaller sections called subnets, each with its own IP range (e.g., 10.0.1.0/24 for one part, and 10.0.2.0/24 for another).
5. `Security`: You can set up Network Security Groups (NSGs), which let you control which types of traffic (e.g., web traffic, SSH) are allowed into and out of your VMs.
6. Once all the details are filled in, click Create.

### What Information Do You Need to Plan a VNet?
1. `Address Space`:
   * This is the range of IP addresses you want to use in your VNet, written in CIDR notation (like 10.1.0.0/16).
2. `Subnets`:
   * Subnets break the VNet into smaller pieces. Each piece will have its own range of IP addresses.
3. `Security`:
   * You can decide to use Network Security Groups (NSGs) to manage who can access different parts of the network.
4. `Connectivity`:
   * Do you need to connect your VNet to other networks, like your office network? You may need a VPN Gateway for that.
5. `Region`:
   * Choose where your VNet will be located. It’s best to keep it close to your other resources to reduce delays.





