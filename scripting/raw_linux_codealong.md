# Documentation of Linux code along (02/10/2024)

- [Documentation of Linux code along (02/10/2024)](#documentation-of-linux-code-along-02102024)
- [Raw Notes:](#raw-notes)
  - [Linux:](#linux)
  - [Basic Linux Commands](#basic-linux-commands)
  - [Ramon's tips and tricks](#ramons-tips-and-tricks)
- [Some Linux Commands](#some-linux-commands)
  - [download a file: using the `curl` command to downloada an image.](#download-a-file-using-the-curl-command-to-downloada-an-image)
  - [Copying a file (e.g., cat image).](#copying-a-file-eg-cat-image)
  - [Make a directory - Mkdir](#make-a-directory---mkdir)
  - [How you name files and folders](#how-you-name-files-and-folders)
  - [Create a file](#create-a-file)
    - [Summary:](#summary)
    - [Summary:](#summary-1)
  - [Navigating files and folders](#navigating-files-and-folders)
  - [Logging out of Linux](#logging-out-of-linux)
- [CHAT GPT 3.5 notes adaptation: do we want this?](#chat-gpt-35-notes-adaptation-do-we-want-this)
- [Basic Linux Commands](#basic-linux-commands-1)
    - [Navigation \& File Management](#navigation--file-management)
    - [Useful `ls` Variants](#useful-ls-variants)
    - [Directory Traversal](#directory-traversal)
  - [Additional Linux Concepts](#additional-linux-concepts)
    - [System \& User Information Commands](#system--user-information-commands)
    - [Shell \& Process Management](#shell--process-management)
  - [Ramon's Tips and Tricks](#ramons-tips-and-tricks-1)
    - [Command Shortcuts](#command-shortcuts)
    - [Viewing Hidden Files and Directories](#viewing-hidden-files-and-directories)
  - [Useful Commands](#useful-commands)
    - [System Maintenance](#system-maintenance)
  - [Downloading Files with `curl`](#downloading-files-with-curl)
    - [Basic File Download](#basic-file-download)
  - [Create a Directory:](#create-a-directory)
  - [Delete Files or Directories:](#delete-files-or-directories)
- [Editing Files with Nano](#editing-files-with-nano)
  - [Saving and Exiting in Nano:](#saving-and-exiting-in-nano)
- [Guide to Connecting, Managing Files, and Creating a Script to Set Up Nginx](#guide-to-connecting-managing-files-and-creating-a-script-to-set-up-nginx)
  - [1. Always Test Commands Manually First](#1-always-test-commands-manually-first)
- [Writing a Bash Script](#writing-a-bash-script)
  - [Step 2: Create and Edit the Script:](#step-2-create-and-edit-the-script)
  - [Step 3: Write the Script:](#step-3-write-the-script)
  - [Test and Control Nginx](#test-and-control-nginx)
  - [Step 4: Save and Exit:](#step-4-save-and-exit)
- [Making the Script Executable and Running It](#making-the-script-executable-and-running-it)
- [Managing Nginx](#managing-nginx)
  - [Check Nginx Status:](#check-nginx-status)
  - [Restart Nginx:](#restart-nginx)
  - [Enable Nginx to Start on Boot:](#enable-nginx-to-start-on-boot)
- [Environment Variables](#environment-variables)
- [Kagan's Notes: EDIT LATER:](#kagans-notes-edit-later)
- [What is an environment variable and how do we make one?](#what-is-an-environment-variable-and-how-do-we-make-one)
- [Managing processes](#managing-processes)
- [Killing processors](#killing-processors)


# Raw Notes:

## Linux: 
* What is linux? a clone of the unix operating system that was used on large mainframes. 
  * Linux is a free, open source operating system, released under the GNU General Public License (GPL). Anyone can run, study, modify, and redistribute the source code, or even sell copies of their modified code, as long as they do so under the same license.
* Scales.
* Lots of different distributions out there.
* 
## Basic Linux Commands 
* `ls`: lists the contents of the current directory.
* `cd`: changes the current directory.
* `pwd`: prints the working directory (shows where you are).
* `touch`: creates an empty file.
* `cat`: displays the contents of a file.
* `mv`: moves or renames files or directories.
* `cp`: copies files or directories.
* `rm`: removes files or directories.
* `ls --help`: used with command-line utilities to display usage information or a help guide for that command.
* `ls -a`: The -a option with the ls command lists all files, including hidden files and directories (those starting with a dot .).
* `touch --`: The -- in a command is often used to signify the end of command options, meaning that anything after -- is treated as a file name, even if it starts with a -.
* `cd ..`: changes the directory to the parent directory (moves up one level in the directory structure).
* `cd ../..`: changes the directory up two levels in the directory structure.

  
`uname --help`
`uname -a`
`whoami`: to find out who I'm logged in as. 
Bash shell: a process/software that interprets the commands. 
`cat /etc/shells`: 
`ps --p $$`: 

## Ramon's tips and tricks
`tab`: auto complete.
`history`: gives you a history of every command youve used since youve logged into the machine. 
* there is a clear history command to cover yourself with credentials.
`!(no. of command in history)` and hit enter - it runs the command after looking at the list of: history. Needs to be after using the command 'history'.
`history -w`: clear history file permanently. 
`history -c`: clears the history. 
`ls -a`: see the hidden files and folders. In blue = folders, files = in white.
`ls --help`: for command prompt options.
`-l`: use a long listing format. Long version with lost of detail.
`ls -al`: a lot of information about your hidden files and folders. When you do this command, you might see along the left side of the column: 'dr' = directory (folder), 'rw' = a file.
`.`: current directory.
`..`: parent folder.

# Some Linux Commands
- `uname` : Displays system information.
- `whoami` : Tells you who is logged in.
- `ps` : Displays current processes.
- `history` : Gives youl log of commands used.
  - `history -c` : Clears the history in memory for the current session.
  - `history -w` : Writes the cleared history to the .bash_history file, which effectively empties the history file.
- `ls -al` : Shows all files, as well the long format listing for more detailed information on each file / directory. A directory will appear blue.
- `curl` : Used to transfer data from or to a server using various network protocols, such as HTTP, HTTPS, FTP, and others. Very powerful tool.
- `wget` : Used to download files from the web.
- `file` : Used to see what the file type of specified file.
- `cp` : Copies a file.
- `rm` : Removes a file.
- `sudo` : Super user command input.
  - `sudo apt update -y` : Makes sure the package information is up to date, but doesn't install anything.
  - `sudo apt upgrade -y` : **Dangerous.** Installs packages which could break any work that requires particular versions.
- `cd /` : Changes the current working directory to the root directory.
- `sudo su` : Switches you to the superuser (root) account.
  - `exit` can be used to leave super user.


## download a file: using the `curl` command to downloada an image.
* `curl`: (short for "Client URL") a command line tool that enables data transfer over various network protocols.
* `curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg -- output cat.jpg`
* save to specific folder: `curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg --output /path/to/folder/himalayan-cat.jpg`
* `pwd`: to see the download and wherever it is: /home/adminuser
* `ls`: to see the downloads. 
* `mv himalayan-cat.jpg ~/images/`: to move the image, make sure you know the path!.
`mv chicken-joke.txt funny-stuff`

## Copying a file (e.g., cat image).
* 'cp': copy
* `cp cat.txt cat jpg`: copies a file.
* `ls`
* 'rm cat.txt`: to remove a file.
* `ls`: to check 

## Make a directory - Mkdir
* `mkdir funny-stuff`
* `ls`: to check

## How you name files and folders
* DO NOT PUT SPACES IN, THIS WILL CREATE MANY DIRECTORIES.
* `mkdir my_pictures`: 
* `ls`: 
* `rmdir <directory name>`: remove a directory.
* `rm -r <name of directory>`: also removes directory.
* `mkdir "my pictures"`: creates a directory folder. 
* `ls`: check.
* `cd my\ pictures`: cd to my pictures folder. 
* `cd ..`: back to home directory.

## Create a file
`touch chicken-joke.txt`
* `ls`
* `nano chicken-joke.txt`: nano in to the chicken-joke file.
* `Ctrl+s` = save
* `Ctrl+x` = exit
* `cat chicken-joke.txt`: shows the text on the screen.

* `head -2 chicken-joke.txt`: gives first 2 lines.
* `tail -2 chicken-joke.txt`: last two lines.

* `nl chicken-joke.txt`: numbers the lines.

* `cat chicken-joke.txt | grep chicken`: 
*  `cat chicken-joke.txt | grep the`:

The command `cat chicken-joke.txt | grep chicken` in Git Bash does the following:

1. **`cat chicken-joke.txt`**: This part of the command prints the contents of the file `chicken-joke.txt` to the standard output (your terminal). `cat` is short for "concatenate" and is used to display the contents of files.

2. **`|` (pipe)**: The pipe `|` takes the output of the `cat` command (i.e., the contents of the file `chicken-joke.txt`) and passes it as input to the next command, which is `grep`.

3. **`grep chicken`**: `grep` is a command-line tool used for searching text using patterns (regular expressions). In this case, `grep chicken` searches for lines in the input that contain the word "chicken."

### Summary:
The command reads the contents of `chicken-joke.txt` and then filters and displays only the lines that contain the word "chicken."


The command `cat chicken-joke.txt | grep chicken` in Git Bash does the following:

1. **`cat chicken-joke.txt`**: This part of the command prints the contents of the file `chicken-joke.txt` to the standard output (your terminal). `cat` is short for "concatenate" and is used to display the contents of files.

2. **`|` (pipe)**: The pipe `|` takes the output of the `cat` command (i.e., the contents of the file `chicken-joke.txt`) and passes it as input to the next command, which is `grep`.

3. **`grep chicken`**: `grep` is a command-line tool used for searching text using patterns (regular expressions). In this case, `grep chicken` searches for lines in the input that contain the word "chicken."

### Summary:
The command reads the contents of `chicken-joke.txt` and then filters and displays only the lines that contain the word "chicken."


## Navigating files and folders
* Sometimes it'll say that the package does not exist. This is how we delt with it:
* Install package
* `apt install tree`: only works if you've got root user permissions.
* Root user: the administrater, the 'super user' (sudo = superuser do).
* `sudo apt install tree`: output: no apt package "tree". Because it has no knowledge of it, its not on its list and it doesnt know where to get it from. 
* Update package list: `sudo apt update -y` (the '-y' stops it from prompting you). This is a safe command. It's jst updated the packages list. It hasnt installed anything.
* Output: 24 packages can be upgraded. Run 'apt list --upgradable' to see them.
* `sudo apt install tree`: its working!
* `tree`: shows you current folder down to directory. Creates the hierarchy between files in a Git repository. 

* upgrade command: upgrade all the packages we have installed: this could break the linux system. Your system may depend on a particular package's version. To upgrade this, is to break it. 
* When you first create a vm and log in to it: `sudo apt update -y` (safe) and upgrade ALL packages straight away `sudo apt upgrade -y` THIS COULD BREAK YOUR SOFTWARE.

* `pwd`:
* home directory and root directory are differetn! 

`cd /`:  in Linux switches to the root directory. > pwd (/) > ls (program folders and files) The TOP of the directory tree. 

log in to root temporarily: log in as super user temporarily: `sudo su`: name has changed `root@tech264-georgia-first-vm` > ls > `exit` to become admin user (like normal). 


## Logging out of Linux
adminuser@tech264-georgia-first-vm:/$ `exit`
logout
Connection to 172.167.29.191 closed.
back to: georg@Aceroma MINGW64 ~









# CHAT GPT 3.5 notes adaptation: do we want this?
# Basic Linux Commands 

### Navigation & File Management
- **`ls`**: Lists the contents of the current directory.
- **`cd`**: Changes the current directory.
- **`pwd`**: Prints the working directory (shows where you are).
- **`touch`**: Creates an empty file.
- **`cat`**: Displays the contents of a file.
- **`mv`**: Moves or renames files or directories.
- **`cp`**: Copies files or directories.
- **`rm`**: Removes files or directories.

### Useful `ls` Variants
- **`ls --help`**: Displays usage information or a help guide for `ls` or other command-line utilities.
- **`ls -a`**: Lists all files, including hidden files and directories (those starting with a dot `.`).
- **`ls -al`**: Shows detailed information (long format) about all files, including hidden ones.

### Directory Traversal
- **`cd ..`**: Changes to the parent directory (moves up one level).
- **`cd ../..`**: Moves up two levels in the directory structure.

---

## Additional Linux Concepts

- **Linux**: A clone of the Unix operating system, used on various devices from large servers to personal computers.
  - **Distributions**: Many different versions (distributions) of Linux, like Ubuntu, Fedora, etc.
  - **Scalability**: Linux can scale to run on anything from small devices to large mainframes.

---

### System & User Information Commands
- **`uname --help`**: Displays usage options for the `uname` command.
- **`uname -a`**: Displays detailed system information.
- **`whoami`**: Prints the username of the current user.

### Shell & Process Management
- **Bash Shell**: A command-line interpreter that runs commands.
- **`cat /etc/shells`**: Displays a list of available shells.
- **`ps --p $$`**: Shows the current process related to the shell.

---

## Ramon's Tips and Tricks

### Command Shortcuts
- **`tab`**: Auto-completes file names and commands.
- **`history`**: Lists all commands used in the current session.
  - **`history -c`**: Clears the command history for the current session.
  - **`history -w`**: Clears the history file permanently.
- **`!(command number)`**: Runs a previous command from history by its number.

### Viewing Hidden Files and Directories
- **`ls -a`**: Shows hidden files and folders.
  - Directories appear in blue, files appear in white.
- **`ls -al`**: Displays detailed information about both hidden and visible files.
  - `dr`: Represents directories.
  - `rw`: Represents read/write permissions on files.

---

## Useful Commands

- **`uname`**: Displays system information.
- **`whoami`**: Displays the current logged-in user.
- **`ps`**: Shows currently running processes.
- **`curl`**: Transfers data from or to a server using various network protocols (e.g., HTTP, HTTPS).
- **`wget`**: Downloads files from the web.
- **`file`**: Identifies the type of a file.

### System Maintenance
- **`sudo`**: Runs a command as the superuser (administrator).
  - **`sudo apt update -y`**: Updates package lists.
  - **`sudo apt upgrade -y`**: Installs updates, but can break dependencies on certain versions of software.
- **`cd /`**: Changes the working directory to the root directory.
- **`sudo su`**: Switches to the superuser account.
  - **`exit`**: Returns to the previous user account.

---

## Downloading Files with `curl`

### Basic File Download
- **`curl`**: A tool for transferring data over various protocols (HTTP, HTTPS, FTP, etc.).
- Example: Download an image:
  ```bash
  curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg --output cat.jpg


## download a file: using the `curl` command to downloada an image.
* `curl`: (short for "Client URL") a command line tool that enables data transfer over various network protocols.
* `curl "link here" --output cat.jpg`
* `curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg --output cat.jpg`
* save to specific folder: `curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg --output /path/to/folder/himalayan-cat.jpg`
* `pwd`: to see the download and wherever it is: /home/adminuser
* `ls`: to see the downloads. 
* `mv himalayan-cat.jpg ~/images/`: to move the image, make sure you know the path!.



# Making our first bash script: Original notes.
ALWAYS DO IT MANUALLY FIRST - to make sure you KNOW the commands work before you use them. 
* planning out our script file.
* make a new file called 'provision'.
* `nano provision.sh`
* Specifiy the shell you want it to run underneath the commands.
* shbang: `#!`: NEED EVERYTIME YOU WRITE A BASH SCRIPT. need on the top of every bash script. its telling it the location of the bash shell.
* after (no spaces) path to the bashshell: `#!/bin/bash`
* nginx: 

`sudo apt install -y`

make sure nginx is running: `sudo systemctl` (control system processes) OR `sudo systemctl status nginx`

`Ctrl+z`: to get out of it. (less harsh)
`Ctrl+c`:

how to restear nginx: `sudo systemctl restart nginx`

how to enable nginx: `sudo systemctl enable nginx`

to run the script: in linux you have to tell them where the script is: `./provision.sh`

`chmod +x provision.sh`






# Navigating the Remote Server
Once you're connected to the server, you'll want to move around the file system and see what's there.

`ls`: This command lists all the files and directories in your current location.

`tree`: View Directory Structure: This shows the folder structure in a tree-like format, displaying directories and subdirectories.

`cd <directory-name>`: Change Directory: You use this command to move into a specific folder. e.g., cd 'funny-stuff/'. Explanation: You are moving into the funny-stuff folder.



# Basic File Management
Now, you can manage files by moving, creating, and deleting them.

Move Files: `mv <file> <destination-directory>` The mv command moves a file from one location to another. It can also be used to rename files.
```bash
mv chicken-joke.txt funny-stuff/
# This command moves the file chicken-joke.txt into the funny-stuff folder.
```

## Create a Directory:

`mkdir <directory-name>`: mkdir stands for "make directory." It creates a new folder.
```bash
mkdir funny-jokes
# You are creating a new directory called funny-jokes.
```

## Delete Files or Directories:
* Delete a file:

```bash
rm <file-name>
# rm stands for "remove" and is used to delete a file.
```

* Delete a directory (and all its contents):
```bash
rm -r <directory-name>
# The -r option means "recursive," which tells the command to delete the folder and everything inside it.
```
Example:

```bash
rm -r funny-stuff/
# You are deleting the entire funny-stuff directory and its contents.
```

# Editing Files with Nano
To edit files on the server, you can use the nano text editor. It's a simple, command-line text editor.

```bash
nano <file-name>
```

Example:
```bash
nano chicken-joke.txt
# This command opens the file chicken-joke.txt for editing.
```

## Saving and Exiting in Nano:
* After editing, press `CTRL+s` to save.
* Then press `CTRL+x` to exit the editor.



# Guide to Connecting, Managing Files, and Creating a Script to Set Up Nginx
## 1. Always Test Commands Manually First
   * Before writing a script, it's important to manually run the commands. 
   * This ensures that the commands work as expected. Once you're sure, you can script them.



# Writing a Bash Script
You can automate tasks by writing a script in Bash. This script will contain a series of commands that the system will execute in sequence.

## Step 2: Create and Edit the Script:
```bash
nano provision.sh
# This command creates a new file named provision.sh and opens it in the Nano editor for you to add commands.
```

## Step 3: Write the Script: 
* Specify the Shell with a Shebang #!

At the very top of every Bash script, you need a "shebang" (#!). This tells the system the location of the shell that should execute the script. `#!/bin/bash` ensures that the script runs under the Bash shell.

Here’s an example of a simple script to update, upgrade, and install the Nginx web server:
```bash
#!/bin/bash

# update
sudo apt update -y

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx - to start on boot
sudo systemctl enable nginx
```

Explanation:

`sudo apt update -y`: Updates the package list.
`sudo apt upgrade -y`: Installs available updates.
`sudo apt install nginx -y`: Installs the Nginx web server.
`sudo systemctl restart nginx`: Restarts Nginx to apply any changes.
`sudo systemctl enable nginx`: Enables Nginx to start automatically when the system boots.

## Test and Control Nginx
To ensure Nginx is running, you can manually check its status using the following command:
`sudo systemctl status nginx`.
* This command shows whether Nginx is running or stopped. You can also control Nginx processes using `systemctl`.


## Step 4: Save and Exit: 
Once you've written the script, press `ctrl+s` to save, and `ctrl+x` to exit Nano.

---

# Making the Script Executable and Running It
To run a script, you first need to make it executable:
```bash
chmod +x provision.sh
# The chmod +x command gives execute permissions to the file provision.sh, allowing it to be run as a program.
```

Now you can run the script:

```bash
./provision.sh
# The ./ tells the system to execute the file in the current directory.
```

# Managing Nginx
After installing Nginx, you can manage its status and control it using the systemctl command.

## Check Nginx Status:

```bash
sudo systemctl status nginx
```
* This shows the current status of the Nginx service, including whether it is running or stopped.

## Restart Nginx:
```bash
sudo systemctl restart nginx
```
* This restarts Nginx, useful after making configuration changes.


## Enable Nginx to Start on Boot:
```bash
sudo systemctl enable nginx
```
* This command enables Nginx to start automatically whenever the server boots up.








# Environment Variables
A container for storing data vales.
* Storing a value in memory.
* Give it a particular name. 

Why do we use them?
* a value in memory that is available to any tool that want to look up those values or a particular command.

Contain information about where to go and find a database (a connection string). 
* set them in memory so anyone can look them up at any time. 

What environment variables do we already have?
* `printenv`: print variables to the scren.
* `printenv <variable in captial letters>`: too look up a particular variable.
*  : to store a variable.


# Kagan's Notes: EDIT LATER:
# What is an environment variable and how do we make one?
 
An **environment variable** is a dynamic **variable** stored in a process environment. It is used to **pass** configuration information and settings to processes running in the system. These **variables** can influence the behavior of software and system components by providing information such as paths, user preferences, and system settings.
- To view these, we can use the command `printenv`.
- We can view a certain environment variable by using `printenv VARIABLENAME`.
- To set a **variable**, we can use `VARIABLENAME=data`. This is a **shell variable**. To ensure this worked, we could use `echo $VARIABLENAME`, which would then output the `data` value. **Note** that this is **NOT** the same as an **enviornment variable**.
- To set an **environment variable**, we can use `export VARIABLENAME=data`, Which would then display it if we used `printenv MYNAME`. If we were to log out, the created **environment variable** would disappear as it is not **persistent**.
- If we were to set our **environment variable** inside of the hidden `.bashrc`, it would be visible to the user (admin) across sessions, making it **persistent**. **Note** that `.bashrc` is unique to the user. We can do this by using `nano .bashrc` and writing `export VARIABLENAME=data` in the file.

##########################################################################


MYNAME=georgia

`echo $MYNAME`

turn the variable into an environment variable:
* `export <variable name>`: 

make a variable persistent:
* survive logging out and logging back in, we need to make it persistent
* Whilat in home directory: 'ls -a'
* set environment variable in .bashrc
edit .bashrc file:

* nano .bashrc
* export added to the end. 
* tail -4 .bashrc : to look at the 4 last lines. 

`echo "export MYNAME=georgia_is_persistent" >> .filename`: will get that output and will save it into a file you specify.  
`>>` adds it to the end of the specified file (appending). 


# Managing processes
* a process is a prgram thats been loaded into memory (RAM).
* it could be being processed by the CPU or sitting idle. 
* thye may be running at the same time but that doent mean the CPU is running.  
* they can be running in memory.
* if its doing multiple instructions at te same time, it will need more than one core. 
* multicore CPUs can run multiple at a time.
* single core can only run 1 at a time.

Two types:
* user pocesors
* System processors

`ps`: shows processors: will only show the user processors.
`TTY`: refering to the id of the terminal session. 
`ps --help simple`: to get simple help to see processors.
`ps -A` or `ps -e`: to see the whole list of processors. 
`ps aux`: all comprehensive information about processors.
`PPID`: parent process ID: the partent process thst started another process.
top command : orders the processors by default: the ones using the most CPU.
`Shift+M`: can see its ordered by the ones using the most memory.
`Shift+N`: order by newest processes. newest - oldest.
`Shift+P`: see which is using the most procesing power. 
`q`: for quit (to get out of this). 


# Killing processors
* Run a process
`sleep 3`: delay of 3 seconds. Puts the foreground to sleep. While it does this, we cant do anything. 
`sleep 5000 &` : & tells it to run in in the background. Output: [1] 2171 (process id).
`job`: see processes running in the background. 
` : how to end sleep process that is in the background (kill command).

there are different levels of kill. You can be gentle (kill signal 1) (a hang up signal, like the phone).
You'll need your process id from before^: (example) `kill -1 2171` > `jobs -l`: to show/check it.  

harsh/terminate: `kill <ID number>` > to show/check it.  Output: [2]+  2181 Terminated 

brute force: `kill -9 <ID>` >  `jobs -l`: Output: 2244 Killed






