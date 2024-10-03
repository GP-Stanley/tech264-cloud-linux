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
  - [download a file: using the `curl` command to downloada an image.](#download-a-file-using-the-curl-command-to-downloada-an-image-1)


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
* `nano in to the chicken-joke file: `nano chicken-joke.txt'
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


