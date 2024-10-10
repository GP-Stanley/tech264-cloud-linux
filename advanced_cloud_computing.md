# Week 4

## Get the 'app'folder onto the Azure VM using "git"
#### Task
* Get the app folder onto a GitHub repo called tech264-sparta-app, then
* use a git command to get the repo onto your Azure Linux VM
* Test your app runs manually
* Document
* Post in the chat in the chat to your app running on port 3000

### Part 1: Upload the app folder to your GitHub repository
Step 1: Initialize a Git Repository in Your App Folder
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

`Item potent`: it means you've designed it so that no matter how many times you run it, it will still achieve the desired state. It should work every single time. 

# Task: Get a reverse proxy working: 
* Manually change Nginx config file (it is possible to change one line ideally) + restart Nginx + test in web browser without port 3000 on the end.
  * Hint: Backup the nginx config file before you start making changes: that way you can easily revert back to the original file to re-test (such as with the sed command later)
  * Automate with your script. Use sed command to replace the string you need to inside the Nginx config file

Deliver: Post link to public IP (without port 3000) in the main chat with a message like "reverse proxy configured"

If you are really stuck...

* Research how to setup nginx so that by default, the default website will be http://localhost:3000/ (from the perspective of nginx) so you will just need to go to the app VM’s public IP address (no port 3000 in the URL) and the Sparta test app will come.
* Use this website to help: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-setup-Nginx-reverse-proxy-servers-by-example
Instead of making a new location (example: location /examples), change the default location (i.e. location /)
Hints:
* Don't worry about setting nginx proxy header values
* Only one line needs to be replaced, the line starting with try_files


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
* The database stores all the application’s data. In a monolithic architecture, there is typically a single, centralized database that all parts of the application interact with.

#### Advantages and Disadvantages
Advantages:
* `Simplicity`: Easier to develop and deploy since everything is in one place.
* `Performance`: Can be optimized for performance as all components are tightly integrated.

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

![original-error](./images/dual_error.png)

![lsof-command](./images/lsof_3000.png)

![kill-command](./images/kill_command.png)

![app-listening](./images/app_listening.png)


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