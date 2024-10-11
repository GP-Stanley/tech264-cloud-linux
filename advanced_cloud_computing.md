# Week 4

- [Week 4](#week-4)
  - [Get the 'app'folder onto the Azure VM using "git"](#get-the-appfolder-onto-the-azure-vm-using-git)
      - [Task](#task)
    - [Part 1: Upload the app folder to your GitHub repository](#part-1-upload-the-app-folder-to-your-github-repository)
  - [Part 2: Clone the GitHub Repository to Your Azure Linux VM](#part-2-clone-the-github-repository-to-your-azure-linux-vm)
  - [Test your app runs manually](#test-your-app-runs-manually)
  - [Task: Finish Bash script to provision and app in the background with \&](#task-finish-bash-script-to-provision-and-app-in-the-background-with-)
    - [Edited bash script:](#edited-bash-script)
  - [Task:](#task-1)
  - [](#)
- [A Reverse Proxy](#a-reverse-proxy)
- [Reverse Proxy \& BindIp](#reverse-proxy--bindip)
- [Task: Get a reverse proxy working:](#task-get-a-reverse-proxy-working)
- [Setting Up an Nginx Reverse Proxy](#setting-up-an-nginx-reverse-proxy)
  - [Task 2: at least get the reverse proxy working manually.](#task-2-at-least-get-the-reverse-proxy-working-manually)
  - [Task: Automate database Stage 2 - Provision Mongo database VM with a Bash script](#task-automate-database-stage-2---provision-mongo-database-vm-with-a-bash-script)
  - [Pre-assessment notes](#pre-assessment-notes)
    - [The Monolith](#the-monolith)
      - [Characteristics:](#characteristics)
      - [Components of a Monolithic Application](#components-of-a-monolithic-application)
      - [Advantages and Disadvantages](#advantages-and-disadvantages)
    - [2-Tier Architecture](#2-tier-architecture)
      - [Characteristics:](#characteristics-1)
      - [1. Application Tier (Client Tier)](#1-application-tier-client-tier)
      - [2. Database Tier (Data Tier)](#2-database-tier-data-tier)
      - [How It Works](#how-it-works)
      - [Advantages](#advantages)
      - [Disadvantages](#disadvantages)
  - [Task: How many services can use a port?](#task-how-many-services-can-use-a-port)
    - [Running two different Git Bash terminals on the same VM simultaneously](#running-two-different-git-bash-terminals-on-the-same-vm-simultaneously)
      - [ERROR](#error)
      - [How to fix it:](#how-to-fix-it)
      - [Kill the process](#kill-the-process)
      - [Re-run the app](#re-run-the-app)
- [PM2](#pm2)
- [Task: run Spaprta app in the background](#task-run-spaprta-app-in-the-background)
- [Using \& to Run the App in the Background](#using--to-run-the-app-in-the-background)
  - [Issue with this Method:](#issue-with-this-method)
- [Using pm2 to Manage the App](#using-pm2-to-manage-the-app)
      - [Installation and Setup:](#installation-and-setup)
    - [Benefits of Using pm2:](#benefits-of-using-pm2)
- [Alternative: Using forever](#alternative-using-forever)
    - [Using forever to Start, Stop, and Restart the App:](#using-forever-to-start-stop-and-restart-the-app)
    - [Benefits of forever:](#benefits-of-forever)
- [Documenting the Methods](#documenting-the-methods)
  - [Using \&:](#using-)
  - [Using pm2:](#using-pm2)
  - [Using forever:](#using-forever)
- [Task: Automate configuration of nginx reverse proxy](#task-automate-configuration-of-nginx-reverse-proxy)
    - [Research how to setup the reverse proxy (single command)](#research-how-to-setup-the-reverse-proxy-single-command)
    - [Purpose](#purpose)
    - [Why Use This Command?](#why-use-this-command)
- [Task: Automate app with /posts page Stage 2 - Modify app VM script to use database VM](#task-automate-app-with-posts-page-stage-2---modify-app-vm-script-to-use-database-vm)
- [Task: Task: Automate app Stage 3 - Automate app deployment with user data](#task-task-automate-app-stage-3---automate-app-deployment-with-user-data)
- [User Data](#user-data)
- [What is User Data?](#what-is-user-data)
  - [Why Use User Data?](#why-use-user-data)
  - [Key Things to Know About User Data:](#key-things-to-know-about-user-data)
    - [Example script:](#example-script)
- [Levels of Automation: Deploying our app on the cloud.](#levels-of-automation-deploying-our-app-on-the-cloud)
    - [1. Manual Deployment (No Automation)](#1-manual-deployment-no-automation)
    - [2. Scripted Deployment (Basic Automation)](#2-scripted-deployment-basic-automation)
    - [3. Infrastructure as Code (Full Automation)](#3-infrastructure-as-code-full-automation)
    - [4. Continuous Deployment (Full Automation + Continuous Integration)](#4-continuous-deployment-full-automation--continuous-integration)
- [Images: Ramon's diagram 10/10/2024](#images-ramons-diagram-10102024)
- [Images on Azure](#images-on-azure)
  - [Types of Images:](#types-of-images)
  - [How You Use Images:](#how-you-use-images)
  - [Benefits:](#benefits)
- [Azure custom images and market images](#azure-custom-images-and-market-images)
  - [1. Azure Marketplace Images](#1-azure-marketplace-images)
  - [2. Custom Images](#2-custom-images)
  - [Key Differences:](#key-differences)
- [Plan for creating an app and database image:](#plan-for-creating-an-app-and-database-image)
    - [Script for app VM from image:](#script-for-app-vm-from-image)
    - [How to create an image:](#how-to-create-an-image)
    - [How to create a VM from an image:](#how-to-create-a-vm-from-an-image)
  - [Before creating the Image](#before-creating-the-image)


## Get the 'app'folder onto the Azure VM using "git"
#### Task
* Get the app folder onto a GitHub repo called tech264-sparta-app, then
* use a git command to get the repo onto your Azure Linux VM
* Test your app runs manually
* Document
* Post in the chat in the chat to your app running on port 3000

### Part 1: Upload the app folder to your GitHub repository
Step 1: Initialise a Git Repository in Your App Folder
* Open your terminal or command line.
* Navigate to the directory where your app folder is located.
* Initialise the Git repository: `git init`

Step 2: Add the Remote GitHub Repository
* Now, connect your local repository to the GitHub repository tech264-sparta-app. `git remote add origin <>`

Step 3: Add Files to Staging
* Add all the files from the app folder to Git's staging area: `git add .`
  
Step 4: Commit the Changes
* Create a commit with a message that describes the changes: `git commit -m ""`
  
Step 5: Push the Changes to GitHub
* Push your local repository to the tech264-sparta-app GitHub repository: `git push -u origin master`
  

## Part 2: Clone the GitHub Repository to Your Azure Linux VM
Step 1: Connect to Your Azure Linux VM
* Use SSH to connect to your Azure VM: `ssh -i ~/.ssh/tech264-georgia-az-key adminuser@172.167.155.248`

Step 2: Install Git (If Not Already Installed)
* Once logged in, ensure Git is installed on the Azure VM. If not, you can install it by running: `sudo apt uppdate -y`, `sudo apt install git`.

Step 3: Clone the GitHub Repository to the VM
* In your VM, navigate to the directory where you want to clone the repository (e.g., /home/your-user/).
* Clone the tech264-sparta-app repository from GitHub: `git clone <git repo website>`

Step 4: Verify the Repository on Your VM
* After cloning, move into the repository folder to check the contents: `cd`, `ls`.


## Test your app runs manually
Step 1: Install Required Dependencies
* Make sure your VM has the required software to run your app. For example, if your app is a Node.js app, you will need to install Node.js and any other dependencies.

1. SSH into your Azure VM (if you’re not already connected): `ssh -i ~/.ssh/tech264-georgia-az-key adminuser@172.167.155.248`
2. Navigate to your app directory: `cd`
3. Install dependencies: 
   1. For a Node.js app with a package.json file: `npm install`
   2. For a Python app with a requirements.txt file: `pip install -r requirements.txt`
4. Start Your App
Once your dependencies are installed, you can manually start your app.
* Go into 'app' folder.
* Node.js Example: If your app uses something like Express.js, you can start the server with: `node app.js`
* Test the app: http://172.167.155.248:3000/




## Task: Finish Bash script to provision and app in the background with &
Develop your script to:
* update & upgrade
* install nginx
* install nodejs v20
* copy your github repo with the app folder
* cd into the app folder
* install & run the app with the "&" at the end (to try and run the app in the background)


### Edited bash script:
```bash
#!/bin/bash
 
GITHUB_REPO="https://github.com/GP-Stanley/tech264-sparta-app"  
REPO_FOLDER="repo"
 
echo update sources list...
sudo apt update -y
echo Done.
 
echo upgrade any upgradable packages available...
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
echo Done.
 
echo install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y
echo Done.
 
echo install nodejs v20...
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
echo Done!
 
echo check nodejs version...
node -v
echo Done!
 
echo Cloning GitHub repository...
git clone $GITHUB_REPO repo
echo Done!
 
echo cd into the app file
cd repo/app
echo now into the app file
 
echo npm install
npm install
echo npm install done
 
echo run the app in the background
node app.js & 
echo all done!
```
- change permissions to allow execution ```chmod +x prov-app.sh```
- execute the script ```./prov-app.sh```

Don't worry about DB right now
Next steps:
* Test your script to make sure it works in your current VM, then on a fresh VM (post a link in the main chat directly to port 3000 - with a message saying its by using your Bash script + a fresh VM).
* Document


Steps:
* Edited bash script.
* Running the script: 
  * make it executable: `chmod +x provision.sh`
  * run the script: `./provision.sh`
  * MAKE SURE :3000 ISN'T RUNNING/BEING USED on a web browser. 
Output:
```bash
2024-10-07 12:11:20 - Repository configured successfully.
2024-10-07 12:11:20 - To install Node.js, run: apt-get install nodejs -y
2024-10-07 12:11:20 - You can use N|solid Runtime as a node.js alternative
2024-10-07 12:11:20 - To install N|solid Runtime, run: apt-get install nsolid -y
```
  * ⚠️ERROR: Node.js is trying to start your app on port 3000, but that port is already occupied, hence the EADDRINUSE (Address in Use) error.
  * `ps aux | grep node` : to see where the :3000 is being used. 
  * `kill -9 <PID>`
  * run the script `./prov-app.sh`
  * Your app is ready and listening on port 3000: `http://172.167.155.248:3000`


## Task:
* Test your script to make sure it works in your current VM, then on a fresh VM (post a link in the main chat directly to port 3000 - with a message saying its by using your Bash script + a fresh VM).
* Document
* Create a new VM.
* Create a new nano provision.sh file
* Make it executable: `chmod +x provision.sh`
* Run the Script: `./prov-app.sh`


Test your script to make sure it works in your current VM, then on a fresh VM 
(post a link in the main chat directly to port 3000 - 
with a message saying its by using your Bash script + a fresh VM).
* http://172.166.147.48:3000/
## 


* we have to check that it's done everything we've asked it to do.
* We'll have to go in manually.
* e.g., check if it's enabled successfully. 
* check scp command: check bindIp, everything. 


> `Item potent`: it means you've designed it so that no matter how many times you run it, it will still achieve the desired state. It should work every single time. 


# A Reverse Proxy
A reverse proxy is like a middleman between your computer (or any device) and the servers where websites or applications are hosted. Here’s why you might use one:

* **Hiding Your Servers**: Imagine you have a bunch of servers running your website. You don’t want everyone to know their exact addresses for security reasons. The reverse proxy stands in front and takes all the requests, then passes them to the right server. This way, the real addresses of your servers stay hidden.
  
* **Sharing the Work**: If lots of people visit your website at the same time, one server might get too busy. The reverse proxy can spread the work across several servers, so no single server gets overwhelmed. This makes your website faster and more reliable.
  
* **Handling Secure Connections**: When you visit a website with “https,” your data is encrypted. The reverse proxy can handle this encryption and decryption, so your servers don’t have to do this extra work. This can make things run more smoothly.
  
* **Speeding Things Up**: The reverse proxy can save copies of your website’s pages. When someone visits, it can quickly send the saved copy instead of asking the server to generate it again. This makes the website load faster.
  
* **Keeping an Eye on Traffic**: It can also keep track of all the requests coming in and out. This helps you understand how people are using your website and spot any problems.
  
* **Optimising Content**: The reverse proxy can also tweak things like compressing files or resising images before sending them to users. This helps your website load faster and use less data.

So, using a reverse proxy helps make your website more secure, faster, and easier to manage.


# Reverse Proxy & BindIp
Using a reverse proxy for the bindIp in your script can be very useful.

1. **Security**: By binding the IP address to the reverse proxy, you can *hide the actual IP addresses of your backend servers*. This adds a layer of security, making it *harder for attackers* to target your servers directly.
   
2. **Load Balancing**: The reverse proxy can *distribute incoming traffic* across multiple backend servers. This helps in balancing the load, ensuring *no single server is overwhelme*d, and *improving *overall *performance* and *reliability*.
   
3. **SSL Termination**: It can handle SSL encryption and decryption, offloading this resource-intensive task from your backend servers. This can *simplify* your *server configuration* and *improve performance*.
   
4. **Caching**: By caching responses, a reverse proxy can *reduce the load* on your backend servers and *speed up response times* for users.
   
5. **Centralised Logging and Monitoring**: It allows you to *centralise logging and monitoring of traffic*, making it *easier to analyse and manage*.
   
6. **Content Optimisation**: A reverse proxy can *optimise content delivery*, such as compressing files or resizing images, to *improve load times* and *reduce bandwidth usage*.
   
Using a reverse proxy for binding an IP address specifically helps in *managing and routing traffic efficiently*, ensuring that your backend infrastructure *remains secure* and *performs optimally*.



# Task: Get a reverse proxy working: 
* Manually change Nginx config file (it is possible to change one line ideally) + restart Nginx + test in web browser without port 3000 on the end.
  * **Hint**: Backup the nginx config file before you start making changes: that way you can easily revert back to the original file to re-test (such as with the sed command later)
  * Automate with your script. Use sed command to replace the string you need to inside the Nginx config file

Deliver: Post link to public IP (without port 3000) in the main chat with a message like "reverse proxy configured"

If you are really stuck...

* Research how to setup nginx so that by default, the default website will be http://localhost:3000/ (from the perspective of nginx) so you will just need to go to the app VM’s public IP address (no port 3000 in the URL) and the Sparta test app will come.
* Use this website to help: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-setup-Nginx-reverse-proxy-servers-by-example
Instead of making a new location (example: location /examples), change the default location (i.e. location /)
  
  **Hints**:
  * Don't worry about setting nginx proxy header values
  * Only one line needs to be replaced, the line starting with try_files


> CHECK YOUR APP IS STILL RUNNING IN THE BACKGROUND. You can use a different git bash window for this: cd into tech > app > `node app.js &`

# Setting Up an Nginx Reverse Proxy
1. Edit the Default Configuration File:
   * Open the default configuration file in Nginx: `sudo nano /etc/nginx/sites-available/default`
   * The most important configuration step in an Nginx reverse proxy setup is adding a proxy_pass setting. This setting maps an incoming URL to a backend server.
   * The proxy_pass directive is configured within the location section of any virtual host configuration file.
   * To set up an Nginx proxy_pass globally, edit the default file in Nginx’s sites-available folder.
2. Locate the Server Block:
   * Find the server block in the configuration file. It typically starts with: `server {`
3. Update the Location Block:
   * Add or update the location block to forward requests to your application running on port 3000. Replace the try_files directive with a proxy_pass directive:
    ```bash
    location / {
        proxy_pass http://localhost:3000;
    }
    ```

4. Create a Symbolic Link:
   * Create a symbolic link to enable the configuration: `sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/`

5. Restart Nginx:
   * Restart Nginx to apply the changes: `sudo systemctl restart nginx`

6. Test the Configuration:
* Open your browser and test the setup by navigating to your domain without adding `:3000`. 
* The reverse proxy should forward the requests to your app running on port 3000.


```bash
server {
    listen 80;


    server_name;  # This handles requests for any domain or >. You shouldn't need your IP here, it should just know.

    location / {
        # Forward requests to the app running on port 3000
        proxy_pass http://localhost:3000;   # 'local host' is the machine itself. 
    }
}
```

```bash
# what i've taken out after the catch-up session with Ramon.
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
```



## Task 2: at least get the reverse proxy working manually. 
* kill command (should be a last resort).
* process managers:`pm2` to start the app, stop the app, and to re-run the app. (so you don't have to use the kill command). 
* get the reverse proxy working: we need something to redirect traffic to port 3000 when we go to the public IP address. to help us achieve this we're using nginx. We want to tell nginx to go to port 3000 instead of the homepage. That is called setting up a reverse proxy. if this is working, you wont have to put :3000 on the end. 
* may need to use systemctl restart once nginx has been edited. 
* `scd`: to do replacement of setting in the configuration file: put this in the bash script after you've installed nginx. 
* Make sure in your script it restarts nginx. 


## Task: Automate database Stage 2 - Provision Mongo database VM with a Bash script
* This script should completely configure the Mongo DB VM so that it is ready for the app VM to connect to the database when the DB VM is started.
* It should:
  * apt update & upgrade
  * install the correct version of Mongo DB
  * configure the bindIp to 0.0.0.0 (Hint: use sed command)
  * start and enable Mongo DB

Make sure you test your db-prov script on your current DB VM, before backing up your script, deleting your DB VM and testing your script on a fresh VM (post link to /posts page in the main chat once your script is working on a fresh DB VM).

When testing, make sure your app can connect to the database.


* create bash script: `nano prov-db.sh`
* insert bash scribt for database. 
*  change permissions to allow execution ```chmod +x prov-db.sh```
*  execute the script ```./prov-db.sh```
*  check MongoDB status: `sudo systemctl status mongod` (it's running).
*  test MongoDB connectivity
   *  From the same VM (local connection): Run the MongoDB shell to ensure MongoDB is accessible: `mongo`.
   *  From another machine (Remote Connection): Try connecting to the MongoDB instance from your app VM or any other machine using the VM's IP address and port 27017: `mongo --host <db-vm-ip-address> --port 27017`
* Verify Configuration Changes: To confirm that the bindIp change to 0.0.0.0 worked:
  * Open the MongoDB configuration file: `cat /etc/mongod.conf`
  * earch for the bindIp line to ensure it now reads: bindIp: 0.0.0.0
* Verify App Connectivity:
  * make sure the database connection works by pointing to the IP address of the MongoDB VM (on port 27017): `mongodb://<db-vm-ip-address>:27017/posts`
  * Check Open Ports
  * To confirm MongoDB is listening on port 27017, run: `sudo lsof -i :27017`



## Pre-assessment notes
A two-tier architecture.
* compare two things: the monolith and 2-tier architecture.
  
### The Monolith
* refers to a software design where all components of an application are integrated into a single, unified system.
* the entire thing is included in the monolith.

#### Characteristics:
 
- **Single Codebase**: Built and deployed as one unit.
- **Tightly Coupled**: Components depend on one another.
- **Simple Development**: Easier to develop and deploy initially.
- **Single Deployment**: Updates require redeploying the entire application.

#### Components of a Monolithic Application
`User Interface (UI)`:
* This is the part of the application that users interact with. It includes all the visual elements like buttons, forms, and menus. In a monolithic architecture, the UI is integrated directly with the rest of the application.
* 
`Business Logic`:
* This is the core functionality of the application. It includes all the rules and operations that define how data is processed and managed. For example, in an e-commerce application, the business logic would handle tasks like processing orders, calculating prices, and managing inventory.

`Data Access Layer`:
* This layer is responsible for reading and writing data to the database. It acts as an intermediary between the business logic and the database, ensuring that data is stored and retrieved correctly.

`Database`:
* The database stores all the application’s data. In a monolithic architecture, there is typically a single, centralised database that all parts of the application interact with.

#### Advantages and Disadvantages
Advantages:
* `Simplicity`: Easier to develop and deploy since everything is in one place.
* `Performance`: Can be optimised for performance as all components are tightly integrated.

Disadvantages:
* `Scalability`: Harder to scale because you have to scale the entire application, not just parts of it.
* `Flexibility`: Difficult to update or change parts of the application without affecting the whole system.
* `Maintenance`: As the application grows, it can become more complex and harder to maintain.
* `Slow to start up`.
* `updating`, `re-deploying`: Working on the same thing at the same time as your team is difficult. 




### 2-Tier Architecture
* A two-tier architecture is a type of software architecture that divides an application into two main layers: the application tier and the database tier. 
  
#### Characteristics:

* **Client-Server Model**: Frontend and backend are separate.
* **Direct Database Access**: Client communicates directly with the database.
* **Decoupling**: UI and backend run independently.

#### 1. Application Tier (Client Tier)
* `User Interface`: This is the part of the application that users interact with. It includes all the visual elements like buttons, forms, and menus.
* `Business Logic`: This layer also contains the business logic, which is the code that processes user inputs and performs the necessary operations. For example, in a banking application, this would include the logic for processing transactions, calculating interest, etc.

#### 2. Database Tier (Data Tier)
* `Data Access Layer`: This layer is responsible for reading and writing data to the database. It acts as an intermediary between the application tier and the database.
* `Database`: This is where all the data is stored. It could be a relational database like MySQL, PostgreSQL, or any other type of database.
  
#### How It Works
In a two-tier architecture, the client (application tier) communicates directly with the database server (database tier). 
Here’s a simple flow:

* User Interaction: The user interacts with the application through the user interface.
* Processing: The application processes the user’s request using the business logic.
* Data Access: If the request involves data, the application sends a query to the database.
* Database Response: The database processes the query and sends the data back to the application.
* Display: The application displays the data to the user.

#### Advantages
* `Simplicity`: Easier to develop and maintain because of its straightforward structure.
* `Performance`: Direct communication between the client and the database can result in faster data retrieval and processing for smaller applications.

#### Disadvantages
* `Scalability`: Not as scalable as multi-tier architectures. As the number of users grows, the database server can become a bottleneck.
* `Maintenance`: Changes in the business logic or database schema can require updates to the entire application.
* `Security`: Direct communication between the client and the database can pose security risks if not properly managed.


## Task: How many services can use a port?
* Try to run the Sparta app from two different Git Bash terminals on the one VM simultaneously
* What error do you get when you try to run another instance of the Sparta app? Take a screenshot of it + add to your documentation.
* You get the error because you are trying to get a second app instance to use port 3000 but it's already in use by the first app instance
* How to fix it - document how to fix it (i.e. re-run the app)
* Find out the Linux command which allows you to find out the process using port 3000
* Document everything you've learnt
  

### Running two different Git Bash terminals on the same VM simultaneously
* you encounter an error because both instances are trying to use the same port (3000). 
* This is a common issue when multiple instances of an app attempt to bind to the same network port.

#### ERROR
* ⚠️ERROR: `Error: listen EADDRINUSE: address already in use :::3000` OR: `Connection timed out` (because you didn't have your database running).
* This error occurs because the first instance of the app is already using port 3000. When the second instance tries to use the same port, the operating system prevents it because a port can only be bound to one process at a time.
* If you try it on the web, you will get "Bad Gateway". This is because something is already using port 3000.

#### How to fix it:
* To fix this issue, you need to terminate the process using port 3000 or run the second instance of the Sparta app on a different port.
* `lsof -i :3000`
* A command list will appear of all the processes listening on port 3000. 
* 
#### Kill the process 
* Once you know the PID (Process ID), you can terminate it using the kill command.
* `kill -9 <PID>`

#### Re-run the app
* After the first process has been terminated, you can run your app again on port 3000.

![original-error](.\scripting\images/dual_error.png)

![lsof-command](.\scripting\images/lsof_3000.png)

![kill-command](.\scripting\images/kill_command.png)

![app-listening](.\scripting\images/app_listening.png)


# PM2 
* is a process manager for Node.js applications that makes it easy to manage and keep your applications running.
* `pm2` is responsible for keeping the `node app process` running. If you try to kill this process, the `pm2` will just create another one. 
* 'graceful kill -15': it will try to shut down any child processes running first and then kill the parent process. 
* `kill -9` on the partent process: will create a zombie process. WE DON'T WANT THIS. 


# Task: run Spaprta app in the background
Work out ways to both run, stop and re-start the app in the background (besides using the "&" at the end of the command):
* One way should use `pm2`
* If time: One other way (can you find another package manager do it like `pm2`?)
* You should have already used "&" at the end the command to run the app in the background - document the issue with using this method when it comes to stopping/re-starting the app
* Document the methods you got working
* Use pm2 to start the app in your app script instead of npm install or node app.js
* Re-run your script, expect an error when gets to pm2 until you add a command to stop the existing app process (or just all stop all processes run pm2)
Check the app is working in your browser at the IP address of the VM with :3000 appended to the end (or without port 3000 in the URL if your reverse proxy is running).


commands to: run the app, stop the app, and start again.


* run pm2 command to stop any processes it's currently running. 
* keep it simple: use the pm2 command to stop any and all processes its running before it runs the script. 



# Using & to Run the App in the Background
* Running the app with & at the end of the command simply starts the app in the background: `node app.js &`
* If you use the '&', you will have to constantly kill the process so it's best to use pm2.

## Issue with this Method:
* While the app runs in the background, managing (stopping or restarting) the app is more difficult because:
* The process may not persist after a terminal session is closed.
* Tracking the process ID (PID) is necessary to stop it, using: `ps aux | grep mode` // `kill <PID>`
* Restarting the app manually each time requires re-running the command.
**Summary**: This method is quick and easy but not suitable for long-term management or production environments due to the difficulty in managing background processes.


# Using pm2 to Manage the App
* pm2 is a popular process manager for Node.js apps that allows you to run, monitor, stop, and restart applications easily. It's a more robust way to manage Node.js processes compared to using &.

#### Installation and Setup:
1. Install pm2:
* Add this step to your script to install pm2: `sudo npm install -g pm2`

2. Use pm2 to Start the App: Replace the node app.js & line with the following command to start the app using pm2: `pm2 start app.js --name sparta-app`
3. Stopping and Restarting the App:

To stop the app: `pm2 stop sparta-app`
To restart the app: `pm2 restart sparta-app`
To check the app's status: `pm2 list`

4. Save the pm2 Process for Auto-Restart: You can save the current state of pm2 processes so they restart on system reboot:
```bash
pm2 save
pm2 startup
```

5. Stopping All pm2 Processes: If you need to stop all running pm2 processes, use: `pm2 stop all`

### Benefits of Using pm2:
* `Auto-restart`: The app automatically restarts if it crashes.
* `Log Management`: pm2 provides a simple way to manage logs.
* `Monitoring`: Easily monitor CPU and memory usage for your apps.
* `Multiple Apps`: Manage multiple apps simultaneously.


# Alternative: Using forever
* Another package similar to pm2 is forever, which also helps to manage Node.js processes.

Installing forever: `sudo npm install -g forever`

### Using forever to Start, Stop, and Restart the App:
* Start the app: `forever start app.js`
* Stop the app: `forever stop app.js`
* Restart the app: `forever restart app.js`
* Check the list of running processes: `forever list`

### Benefits of forever:
* Simple and easy to use for basic process management.
* Keeps the app running indefinitely, restarting it if it crashes.


# Documenting the Methods
Methods Documented:
## Using &:
* The app runs in the background but is hard to manage (stop/restart).
* You must manually track the process ID and kill it to stop it.

## Using pm2:
* A much more powerful process manager, providing automatic restarts, monitoring, and easier management of apps.
* Commands: `pm2 start`, `pm2 stop`, `pm2 restart`, and `pm2 list`.

## Using forever:
* An alternative to pm2, offering similar functionality.
* Commands: `forever start`, `forever stop`, `forever restart`, and `forever list`.





# Task: Automate configuration of nginx reverse proxy
* Research how setup the reverse proxy with a single Bash command (or as few commands as possible) so that it can be used for automating the process later in a Bash script. 
  * Hint: Research Linux commands that can be used to replace line(s) or strings within a text file.
* Test your command manually (i.e. SSH into your app VM)
* Add the reverse proxy commands to your app provision script.
* Test your provision script works to setup the reverse proxy by running the script manually (i.e. SSH into your app VM to run the script)


> CHECK YOUR APP IS STILL RUNNING IN THE BACKGROUND. You can use a different git bash window for this: cd into tech > app > `node app.js &`
1. Add an Nginx proxy_pass setting: `sudo nano /etc/nginx/sites-available/default`
The most important configuration step in an Nginx reverse proxy configuration is the addition of a proxy_pass setting that maps an incoming URL to a backend server.
The proxy_pass is configured in the location section of any virtual host configuration file. To set up an Nginx proxy_pass globally, edit the default file in Nginx’s sites-available folder.
1. Find the server block (it typically starts with `server {`).
2. Add or update the location block to forward requests to your app running on port 3000.
3. replace the try_files directive with a proxy_pass directive that forwards traffic to your app
4. `sudo ln -s /etc/nginx/sites-available/proxy.conf /etc/nginx/sites-enabled/`
5. `sudo systemctl restart nginx`
6. Test it in browser without adding :3000.


```bash
server {
    listen 80;


    server_name;  # This handles requests for any domain or >. You shouldn't need your IP here, it should just know.

    location / {
        # Forward requests to the app running on port 3000
        proxy_pass http://localhost:3000;   # 'local host' is the machine itself. 
    }
}
```

### Research how to setup the reverse proxy (single command)
* You can set up a reverse proxy using Nginx with a single Bash command by creating a configuration file and then starting Nginx. 
* 
*  Use sed to update the proxy settings in the configuration file
`sudo sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default`
   * What the Command Does:
     * The command searches for the line `try_files $uri $uri/ =404;` in the Nginx configuration file located at `/etc/nginx/sites-available/default` and replaces it with `proxy_pass http://localhost:3000;`.
     
  * `sudo`: Runs the command with superuser privileges.
  * `sed`: The stream editor command.
  * `-i`: In-place editing, which means the file is modified directly.


### Purpose
* `Original Line`: `try_files $uri $uri/ =404;`
  * This line tells Nginx to try to serve the requested file. If the file is not found, it returns a 404 error.
* `Replacement Line`: `proxy_pass http://localhost:3000;`
  * This line configures Nginx to forward (proxy) requests to `http://localhost:3000`. This is useful for setting up a reverse proxy, where Nginx forwards incoming requests to another server (in this case, your application running on port 3000).


### Why Use This Command?
* `Automate Configuration Changes`: Using sed in a script allows you to automate the process of updating configuration files, making it easier to deploy changes across multiple servers.
* `Efficiency`: It’s a quick and efficient way to make precise changes to configuration files without manually editing them.






# Task: Automate app with /posts page Stage 2 - Modify app VM script to use database VM
We have already gone through this earlier this afternoon - this is just a reminder to do what's in bold below.

Pre-requisite: You have completed "Task: Automate database Stage 2 - Provision Mongo database VM with a Bash script"

* The final app VM script will need to run after the database VM script is has finished running on the database VM.
* Modify the app VM script already created so that:
  * the environment variable DB_HOST is created just before the app is installed
* DOD:
  * The DB VM script runs successfully on a fresh Linux VM (running Ubuntu 22.04 LTS)
  * After the DB VM script finishes running, the app VM script runs successfully on a fresh Linux VM (running Ubuntu 22.04 LTS)
  * The Sparta app (including the /posts page) comes up in the web browser when you go to the app VM's public IP (because the reverse proxy is also configured by the app provision script).



# Task: Task: Automate app Stage 3 - Automate app deployment with user data
Pre-requisite:

* You have completed "Task: Automate database Stage 2 - Provision Mongo database VM with a Bash script"
* Make sure your app script works on a fresh VM + multiple times first
* Make sure your app script does not clone the app directly to the adminuser's home directory, but to the root directory instead

DOD:
* The DB VM script runs successfully in User Data on a fresh Linux VM (running Ubuntu 22.04 LTS)
* After the DB VM finishes provisioning, the app VM script runs successfully in the User Data on a fresh Linux VM (running Ubuntu 22.04 LTS)
* The Sparta app (including the posts page) comes up in the web browser when you go to the app VM's public IP

Points to note about user data:
* When making VM, go to "Advanced" setting, tick "user data", paste your script in the box
* Avoid modifying your script after pasting into user data. Why?
  * As with any Bash script, it must start with the she-bang line
  * It runs as root user
  * It only runs once (immediately after VM creation)



1. Make sure your app script does not clone the app directly to the adminuser's home directory, but to the root directory instead.
  
* This line in the app script: 
```bash
echo Cloning GitHub repository...
git clone $GITHUB_REPO repo
echo Done!

echo cd into the app file
cd repo/app
echo now into the app file
```




# User Data
* To achieve the next level of automation.
* immediatley after VM is created, user data will be run.
* make sure your NSG allows HTTP.
* automate reverse proxy should be in your app script ?????
* User data only runs once. 
* runs as root user. It's not starting in your home directory. It's starting from the root folder (the very top of the directory folder - root directory). This is where you want to clone http??? 
  * For example, `git clone http` to the repo folder > cd into repo folder (`cd repo/app`). 

# What is User Data?
* User Data is a **script that automatically runs** when you create a new virtual machine (VM).
* It helps **automate tasks** like installing software, setting up your environment, or downloading code.
* You can think of it as a set of instructions that your VM follows to set everything up right after it starts, so you don’t have to do it manually.
* Using User Data helps automate the setup of your VM so your web app can be up and running as soon as the VM is created. 

## Why Use User Data?
* `Automation`: Instead of manually configuring your VM every time it starts, you can provide a script that will automatically run and set up everything for you. This is helpful if you want your app to be ready immediately.
* `Run Once`: The script runs once, right after the VM is created. It won’t run again unless you create a new VM or manually trigger it later.

## Key Things to Know About User Data:
1. The Script Runs as Root:
   * The script runs with **root** (admin) privileges, so you don’t need to use `sudo` for commands in your script.
   * It starts from the **root directory** (`/`), which is the top of the file system. So, when you clone a repository (like from GitHub), make sure to specify where you want it to go.

2. Make Sure Your VM Can Be Accessed:
   * Your virtual machine’s Network Security Group (NSG) controls what traffic can come in or go out of the VM. If you want people to access your app on the web, you need to make sure your NSG allows HTTP (port 80) and/or HTTPS (port 443) traffic.
   * If this isn't set, people won’t be able to reach your app in their web browser.
  
**How to allow HTTP:**
  * Go to the NSG settings for your VM and make sure port 80 (for HTTP) is open for inbound traffic.

3. Setting Up a Reverse Proxy (Nginx):
   * When you're hosting a web app (like a Node.js app), you often use a **reverse proxy**. 
     * This is a program (like Nginx) that takes web traffic coming into your VM and forwards it to the right place (like your app running on port 3000).
   * You can **automate setting up a reverse proxy** in your User Data script, so you don’t have to manually configure it every time.

4. Cloning Your Code:
   * If your app’s code is on GitHub or another repository, you’ll want to **download (clone) it onto your VM**. You can do this as part of your User Data script.

5. One-Time Setup:
   * Since User Data only runs once (right after the VM is created), make sure your script is complete and works correctly. 
     * If there are errors, you’ll need to manually fix them later, so it’s good to test the script in small parts to ensure everything works.

### Example script:
```bash 
#!/bin/bash

# Set up MongoDB connection (replace with the actual IP of your MongoDB VM)
MONGODB_HOST="mongodb://10.0.0.4:27017/posts"
export DB_HOST=$MONGODB_HOST

# Update the package list and upgrade installed packages
apt-get update -y
apt-get upgrade -y

# Install Nginx (web server)
apt-get install -y nginx

# Install Node.js (required for running JavaScript apps)
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs

# Install PM2 (a tool to keep your app running)
npm install -g pm2

# Clone your app from GitHub
git clone https://github.com/yourusername/yourapp.git /home/ubuntu/app
cd /home/ubuntu/app

# Install app dependencies (things your app needs to run)
npm install

# Start the app using PM2 (which will keep it running even if the VM restarts)
pm2 start app.js --name myapp

# Set up Nginx as a reverse proxy (so people can access your app from the web)
sudo sed -i 's|try_files \$uri \$uri/ =404;|proxy_pass http://localhost:3000;|' /etc/nginx/sites-available/default
sudo systemctl restart nginx

```
> What This Script Does:
* **Sets up a MongoDB connection**: It assigns the IP of the MongoDB server to an environment variable (DB_HOST).
* **Updates and upgrades** the system to make sure it has the latest security patches.
* **Installs Nginx**, which will serve as a reverse proxy for the app.
* **Installs Node.js**, which is needed to run the app.
* **Installs PM2**, a process manager that will keep the app running.
* **Clones** the app from GitHub into the /home/ubuntu/app folder.
* **Installs dependencies** (like libraries the app needs).
* **Starts the app** using PM2 so it stays running.
* **Configures Nginx** to forward requests to the app (which is running on port 3000).
  


# Levels of Automation: Deploying our app on the cloud.
1. `Manual Deployment`: Everything is done manually, time-consuming and prone to errors.
2. `Scripted Deployment`: Use scripts to automate setup tasks, faster but still involves some manual steps.
3. `Infrastructure as Code` (IaC): Automate the creation of infrastructure and deployment of apps, highly scalable and replicable.
4. `Continuous Deployment` (CI/CD): Fully automated deployment and updates whenever changes are pushed to the codebase, enabling seamless updates and scaling.

Each level brings more efficiency, scalability, and consistency to your deployment process, with the final goal of having a fully automated pipeline that handles everything from infrastructure to app updates with minimal manual intervention.

### 1. Manual Deployment (No Automation)
At this level, the deployment process is done entirely by hand. This involves manually creating a virtual machine (VM), installing required software, and configuring the environment step-by-step.

    Steps:
    * Create a VM in a cloud provider (like Azure, AWS, or Google Cloud) manually.
    * SSH into the VM to install software (e.g., Nginx, Node.js, MongoDB).
    * Manually download your application code (e.g., clone from GitHub).
    * Set up the environment variables, configure the reverse proxy (Nginx), and start your application.

Pros:
* Simple and easy to understand for beginners.

Cons:
* Time-consuming and error-prone.
* Inconsistent deployments because steps might be missed or done incorrectly.
* Not scalable—each new VM needs to be set up from scratch.    


### 2. Scripted Deployment (Basic Automation)
   * At this level, you automate repetitive tasks by writing scripts (e.g., Bash scripts) that can install the necessary software, clone your app, and set it up. 
   * Instead of doing everything manually, you simply run a script that executes all these commands for you.

   Steps:
   * Write a script that performs all the necessary installation and configuration steps (installing software, setting up environment variables, etc.).
   * Run this script manually after creating a VM.

Pros:
* Faster than manual deployment.
* Reduces the chances of human error.

Cons:
* The script must be run manually (or provided during VM creation with a feature like User Data).
* Still needs some manual intervention to manage different VMs.


### 3. Infrastructure as Code (Full Automation)
* At this level, you automate the entire process of creating the infrastructure (VMs, networks, security groups) and deploying the app. 
* Infrastructure as Code (IaC) tools like Terraform or Azure Resource Manager (ARM) templates are used to define and provision the infrastructure using configuration files. 
* This way, everything is automated—from creating the VM to deploying the application.

Steps:
* Use an IaC tool (like Terraform, AWS CloudFormation, or ARM templates) to define the cloud resources required for your app (VMs, load balancers, databases, etc.).
* Write deployment scripts to automate the configuration and deployment of the app on the provisioned VMs.
* Deploy the entire infrastructure and application automatically with one command.

Pros:
* Full automation, including infrastructure provisioning.
* Can easily replicate the entire setup in multiple environments (dev, test, prod) with consistent results.
* Scalable—automatically creates and deploys VMs as needed.

Cons:
* Requires learning IaC tools.
* More complex to set up initially, but pays off in the long run.


### 4. Continuous Deployment (Full Automation + Continuous Integration)
* At this level, you not only automate infrastructure and deployment but also integrate it with a CI/CD pipeline. 
* This allows your application to be automatically deployed and updated whenever you push changes to your code repository (e.g., GitHub, GitLab).

Steps:
* Set up a CI/CD pipeline (e.g., with Jenkins, GitHub Actions, or Azure DevOps) to automatically build, test, and deploy your application whenever changes are pushed to the repository.
* Use IaC tools to automatically provision infrastructure and deploy the app on it.
* Ensure that new code changes trigger redeployment, making the process seamless.

Pros:
* The most advanced and efficient deployment process.
* Full automation from code push to deployment.
* Enables continuous updates and scaling without manual intervention.

Cons:
* The most complex to set up initially.
* Requires knowledge of CI/CD tools and processes.


# Images: Ramon's diagram 10/10/2024
* We've been using Ubuntu Pro 22 (a market place image). 
* We've been using a market place image to create our Vms.
  * The image determines everything thats going to go on the disk.
  * Then we prepared the VM to run the app. 
  * Create a custom image, used to create an app VM with everything already installed. 
  
"requires Plan information": you can't do this unless your provide information about the origihnal market place image you used. This is because you need to give credit: sometimes they may need to charge you. You need to provide that information when you create your VM.
  * they want to have info on the original market place image that you included. 
  * To solve this: don't use the one from ubuntu, we'll be using a custom marketplace image that Ramon has set up. `ramon-official-ubuntu2204-clean-image`

Resource group > tech264 > ramon clean image > 
In order to create a custom image:
* needs to be based on something: it needs a source file that contains what that image is going to use. 
* To get those files, if you go to ubuntu.com, you can download a virtual harddisk file (matching the ubuntu version youre using), then you have to upload from you local machine it to blob storgae in Azure. From blob storage, you can then use that file to creat a custom image. 
* The custmo image will have all the files that are included in that virtual harddisk file that you downloaded. 

Check script has worked:
* `sudo systemctl status mongod` > until it starts running (this m ay take a while).
* `cat /etc/mongod.conf | grep bindIp` > should be 0.0.0.0
* `sudo systemctl is-enabled mongod` > check if its enabled > should sau 'enabled'. 


# Images on Azure
*  an "image" is like a **blueprint or template** that helps you **create a virtual machine (VM) quickly**. 
*  Think of it as a **pre-built package** that **includes everything you need** to get your virtual computer (VM) up and running, such as an operating system (like Windows or Linux) and sometimes additional software.

## Types of Images:
* `Predefined Images`: Azure provides many standard images for **common operating systems** (like Ubuntu, Windows Server) or configurations. 
  * For example, you can choose an image with Ubuntu Linux already installed, so when the VM is created, it’s ready to go.

* `Custom Images`: You can also **create your own image** that includes the OS and any special software or configurations you need. 
  * This is helpful if you want to replicate the same setup across multiple VMs quickly.

## How You Use Images:
* When you want to create a VM, you **select an image** from Azure's image gallery (like choosing "Ubuntu 22.04" or "Windows Server 2022").
* Azure **uses that image to build your VM**, meaning the **VM will have** all the **software and configurations from the image**, so you **don’t need to set it up manually**.

## Benefits:
* `Faster Deployment`: Since the OS and software are already installed, your VM is ready to use much faster.
* `Consistency`: If you use the same image to create multiple VMs, they’ll all have the same setup, which makes it easier to manage them.

In short, Azure images help you quickly create virtual machines that are ready to use, without having to manually install an operating system or software.



# Azure custom images and market images
* virtual machines (VMs) can be created using either custom images or marketplace images.

## 1. Azure Marketplace Images
* These are **pre-built images available** in the Azure Marketplace, which is like a store for cloud resources. They are created and maintained by either Microsoft or third-party vendors. When you create a virtual machine (VM), you can choose one of these **pre-configured images**.
  * `What's included`: Operating systems (like Windows Server, Ubuntu, etc.) and sometimes additional software (like web servers, databases, or complete solutions like a WordPress environment).
  * `Ease of use`: Very convenient because they are ready to go, often requiring just a few settings from you (like VM size, region, etc.).
  * `Who uses them`: Ideal for beginners or people who want a quick, standardised setup without customisation.
  * `Updates`: Managed by the image publisher, ensuring that the software is kept up to date.

## 2. Custom Images
* A custom image is something you **create yourself**, **based on a VM that you have already configured**. Essentially, you take a *snapshot of a VM* (its operating system, installed software, settings, etc.) and *turn it into an image* that can be *used to create new VMs*.
  * `What's included`: Everything you’ve customized on the original VM (the operating system, software, specific configurations).
  * `Flexibility`: You have total control over the VM’s configuration, meaning it’s tailor-made to fit your exact needs.
  * `Who uses them`: Useful for experienced users or companies that need a specific configuration repeated across multiple VMs.
  * `Use case`: If you have set up a specific environment or application that you want to replicate, custom images are the way to go.

## Key Differences:

| Feature                | Azure Marketplace Images                        | Azure Custom Images                      |
|------------------------|-------------------------------------------------|------------------------------------------|
| **Definition**          | Pre-built images from Azure Marketplace         | Images you create from your customised VMs |
| **What's included**     | Pre-configured OS and sometimes additional software | All software, settings, and OS from your original VM |
| **Ease of use**         | Very convenient and ready to deploy             | Requires creating and managing your own image |
| **Flexibility**         | Limited customisation                           | Full control and customisation           |
| **Managed by**          | Publisher (Microsoft or third-party)            | You or your team                         |
| **Ideal for**           | Beginners or quick setups                       | Experienced users or tailored setups     |
| **Updates**             | Handled by the image publisher                  | You are responsible for updates          |





# Plan for creating an app and database image:
1. Created database VM: using custom image (Ramon's) and user data to run entire database script. ✅
2. SSH'd in: Tested that user data did it's job. ✅
3. Create app VM using custom image and user data to run the entire app script. 
   * Make sure the DB_HOST variable has the correct IP. ✅
4. test by:
   * check the public IP can bring up the home page. ✅
   * check /posts page. 
5. Create database VM image from the database VM.
   * delete the old db VM. 
6. Create database VM from the database image. ✅
7. Create app VM image from the app VM. 
   * delete the old app VM. 
8. Create app VM from the app image we just created. 
9. /posts page to work connecting to the database VM made from image. 
    * we want to use image and a littble bit of user data. You're going to have to have a special script - "`run-app-only.sh`"

### Script for app VM from image: 
The bottom part of your full app script.
 * start with she-bang.
 * export db host variable. 
 * cd into the app folder. 
 * npm install (might not need). 
 * pm2 stop all (either or).
 * pm2 start app.js

```bash
#!/bin/bash

GITHUB_REPO="https://github.com/GP-Stanley/tech264-sparta-app"

MONGODB_HOST="mongodb://10.0.3.4:27017/posts"

echo "Connect via our VMs via IP."
export DB_HOST=$MONGODB_HOST
echo "Connection complete."
printenv DB_HOST
echo "env variable set."

echo cd into the app file
cd repo/app
echo now into the app file

# Stop any existing pm2 processes
echo stopping any running pm2 processes...
pm2 stop all

# Run the app
echo Run app...
pm2 start app.js
echo Done!
```


### How to create an image:
`db vm` > `capture` > `image` > No, capture only managed image > Name: `tech264-georgia-ready-to-run-db-image` > 

**This is the same for app vm.**

### How to create a VM from an image:
`image` > `create VM` > add `run-app-only` bash script to user data > 


> Make sure when you need to run the app, run the database first. 

## Before creating the Image
* Before creating an image, use "`sudo waagent -deprovision+user`" to prepare the Linux guest OS on the virtual machine. 
* If you create an image from a virtual machine that hasn't been generalised, any virtual machines created from that image won't start.

^^^ **MAKE THIS COMMAND AFTER YOU SSH'd into YOUR VM. **It gets rid of specific information that we don't want. 
* exit out. 



# Ramon's diagram

**WORSE:**
* You have your app VM.
* the CPU load is too high (because of too much traffic).
* This will cause the VM to stop working or respomnding. 

**NOT SO WORSE:**
* You have your app VM.
* We use an Azure Monitor (CPU load) so we can see what's happening. 
* We can use a dashboard to help prevent a situation from falling over.
* However, having someone constantly watching it is not ideal.

**A BIT BETTER:**
* You have your app VM.
* We use an Azure Monitor (CPU load) so we can see what's happening. 
* Set up an alert/alarm so that when things reach a certain point - you get an alert. E.g., CPU load gets to 70%. 
* (notification) Decide how you want to be notified: email, phone, etc. Telling you about the problem.

**BETTER:** 
* You have your app VM.
* We use an Azure Monitor (CPU load) so we can see what's happening. 
* Auto-Scaling is the solution!
* Fixes will get automatically created to handle the new load. 
* Things will automatically scale back. 


![ramons-diagram](.\scripting\images\ramons-diagram.png)

---

# Auto scaling
1. `Adjusting Resources Automatically`: Auto scaling automatically adds more “staff” (computers or servers) when there’s a lot of traffic to your website or application. When the traffic goes down, it reduces the number of servers, so you’re not paying for resources you don’t need.
  
2. `Efficiency`: This helps ensure your website runs smoothly without wasting money. You have just the right amount of resources at any given time.
  
3. `Types of Scaling`:
   * *Scaling Out/In* (Horizontal Scaling): This means adding more servers when needed and removing them when they’re not. It’s like hiring extra staff for busy days and letting them go when things are quiet.
   * *Scaling Up/Down* (Vertical Scaling): This means making your existing servers more powerful or less powerful. It’s like giving your staff extra tools to work faster or taking them away when they’re not needed.

4. `Why It’s Useful`: Auto scaling is great for websites or apps that have unpredictable traffic. For example, an online store might get a lot of visitors during a sale, or a news site might get a spike in traffic when big news breaks.
   
5. `How It Works`: Cloud providers like AWS, Azure, and Google Cloud offer auto scaling services. They monitor your application and adjust the resources based on how busy it is, following rules you set up.
   
> Auto scaling helps your website or app handle more visitors when needed and saves money when things are quiet, all without you having to manually adjust anything.

---


# Types of Scaling

## Vertical Scaling

### 1. Scalling-up
   * Scaling up in VMs means **increasing the power** of your existing VM. You might add more CPU, RAM, or storage to handle more tasks.
   * Scaling-up: increasing the size of the VM.
   * It copies whatever work load is on this VM and is copied to a bigger VM. 
   * Once its copied the workload, it deletes the smaller VM. 

### 2. Scaling-down
  * Scaling down means **reducing the power of your VM**. 
  * You might decrease the CPU, RAM, or storage when you don’t need as much capacity.


## Horizontal Scaling

### 1. Scaling-out
  * In the world of VMs, scaling out means **adding more VMs to handle increased load**. If your website gets a lot of visitors, you add more VMs to share the work.
  * You may get more of those VM's duplicated. 

### 2. Scaling-in
  * Scaling in means removing some VMs when the load decreases.
  * This helps save resources and money.


## Real-World Example
* Imagine you run an online store. During a big sale, lots of people visit your site:

* `Horizontal Scaling`: You **add more VMs** to handle all the visitors. After the sale, you remove the extra VMs.
* `Vertical Scaling`: If you expect a steady increase in traffic, you might **upgrade** your main VM to handle more visitors **without adding new ones**.


#### To summerise:
* **horizontal** scaling *adds or removes* VMs to match the load.
* **vertical** scaling *changes the power* of your existing VM. 
* Both methods help ensure your application *runs smoothl*y and *efficiently*.

--- 


# Task: created: tech264-georgia-test-monitoring-with-app
* we created a vm from the app image.
* The only difference is weve added only this into the user data as we are not connecting to the database: 
```bash
#!/bin/bash
echo cd into the app file
cd repo/app
echo now into the app file

# Stop any existing pm2 processes
echo stopping any running pm2 processes...
pm2 stop all

# Run the app
echo Run app...
pm2 start app.js
echo Done!
```

# Create a dashboard
* Be on the Overview page.
* Scroll down to monitoring tab.
* Charts under Performance and Utilisation. 
* "See all metrics"/"Show more metrics": to see all metrics.
* We want to add 
* Pin (CPU average option) > create new > shared > nasme: `tech264-georgia-shared-app-dashboard` > create and pin.
* pin disk/operations/sec (average): eisting > shared > dashboard name. 
* Same again with: network (total). 

## How to view the dashboard:
* Search 'dashboard hub' on Azure.
* Go to 'shared dashboards' 
* Click on the link under 'go to dashboard' heading.

## How to arrange your dashboard
* click 'Edit'.
* click and drag the charts to fit on one line. 
* Click 'save'. 
* if you want to see the metrics of that time (whichever you've chosen), click on the chart, in the top right corner you can choose your timeline. 
* Click 'apply' to save it. 
* Save to dashboard if you want to keep it that way. Otherwise it won't save.


# Load Testing Simulation
* Aim: we want to trigger the CPU to cause an alert. 
* Work out what the threshold is for it to work. 


## How to manually start tech264-georgia-test-monitoring-with-app
* SSH in.
* `pm2 start /repo/app/app.js`.
* pm2 start app.js

* ⚠️PROBLEMS⚠️: got to root directory > go to app folder > `pm2 stop all` > `sudo pm2 start app.js`. 


# How to connect the VM app after you stop it and start again - using  SSH key
 
1. Connect the `VM with SSH key`
2. To see the `repo/app`- need to be in root directory  -> `cd /repo/app`
3. Stop all processes -> `pm2 stop all`
4. To start the app -> `sudo pm2 start app.js`


# Tool to spike the CPU
* Simulate the situation: it gives the CPU instructions on your behalf.
* Give requests using a tool.

## Apatchy Bench (AB): install it first. 
* `sudo apt-get install apache2-utils -y`


# Load testing
`ab -n 1000 -c 100 http://yourwebsite.com/`
* we're going to modify this command so it works for us. 
* This is going to send a thousand requests (-n 1000) in blocks of 100 (-c 100). 
* Add your public IP address: http://172.167.64.221/
* `ab -n 1000 -c 100 http://172.167.64.221/`

### Increase the values
* `ab -n 10000 -c 200 http://172.167.64.221/`
* Outcome: it failed after 1000 requests. 



* set your thresh hold so it will trigger, (36% ?). 

