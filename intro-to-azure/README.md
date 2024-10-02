# Understanding Azure

## Introduction to Azure
Azure is Microsoft's cloud computing platform, offering a wide range of services like computing, storage, networking, and analytics. It helps organisations build, manage, and deploy applications on a global scale. Azure provides a pay-as-you-go model, meaning you only pay for the resources you use.

## Azure Regions and Availability Zones
* `Regions`: Azure has datacenters around the world, grouped into regions. A region is a specific geographical area that contains multiple data centers. Examples include East US, West Europe, and Southeast Asia.

* `Availability Zones`: These are physically separated data centers within a region. Each zone has independent power, cooling, and networking, ensuring higher availability and fault tolerance. If one zone fails, others can still provide service.

**Takeaway**: Azure’s structure ensures services are highly available and resilient, even in the event of hardware failure or disaster.

![scope-levels](image.png)


---
## How is Azure Structured/Organised?
Azure is organised into:

* `Subscriptions`: A subscription is like an account that contains the resources (VMs, databases, etc.). Each subscription has limits, such as how many resources you can deploy.
  
* `Resource Groups`: These are logical containers that group related resources (like VMs, storage accounts, etc.) so they can be managed as a single unit.

* `Resources`: Actual services and applications, such as virtual machines (VMs), databases, and storage accounts.

**Takeaway**: Organising resources into groups and subscriptions helps simplify management and billing.


![scope-levels](images/scope-levels.png)

---
## Types of Services Azure Provides
Azure offers a vast array of services, categorised into:
1. `Compute`: Virtual Machines, App Services, Containers.
2. `Networking`: Virtual Networks, Load Balancers, DNS.
3. `Storage`: Blob Storage, File Storage, Disk Storage.
4. `Databases`: SQL Database, CosmosDB, MySQL.
5. `AI and Machine Learning`: Cognitive Services, Machine Learning Studio.
6. `Analytics`: Synapse Analytics, Data Lake, Power BI.
7. `DevOps`: Pipelines, Repos, Boards.

---
## Ways to Access Azure
You can access Azure in multiple ways:
1. `Azure Portal`: A web-based, graphical interface for managing Azure resources.
2. `Azure CLI`: A command-line interface that lets you manage Azure resources from your terminal.
3. `Azure PowerShell`: A task automation framework used to manage Azure resources through PowerShell commands.
4. `Azure SDKs`: Software Development Kits for various programming languages (e.g., Python, .NET) to integrate Azure services in your applications.
   
**Takeaway**: Azure offers flexibility in managing resources, whether through GUI, command-line, or automated scripts.

---
## Difference Between Azure and Azure DevOps
* `Azure`: A general-purpose cloud platform that provides infrastructure and services to build, deploy, and manage applications globally.

* `Azure DevOps`: A set of tools for developers to plan, build, test, and deploy applications. It includes Pipelines, Repos, and Boards for CI/CD processes, version control, and agile project management.

**Takeaway**: Azure is the infrastructure and service provider, while Azure DevOps helps developers streamline application development and deployment.

---
## Why Use the Azure Pricing Calculator?
The `Azure Pricing Calculator` helps you estimate costs for using different Azure services. You can input the services you plan to use, such as virtual machines, storage, and databases, to get an estimate of your monthly bill.

**Takeaway**: This tool helps prevent unexpected costs and enables better budgeting and planning.

