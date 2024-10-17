# Wed, 16/10, Code-Along: Use SSH to push changes to your GitHub Repo

- [Wed, 16/10, Code-Along: Use SSH to push changes to your GitHub Repo](#wed-1610-code-along-use-ssh-to-push-changes-to-your-github-repo)
- [A Guide to Setting Up SSH Keys for Use with GitHub](#a-guide-to-setting-up-ssh-keys-for-use-with-github)
  - [Background Information](#background-information)
  - [Step 1: Create/Generate an SSH Key pair.](#step-1-creategenerate-an-ssh-key-pair)
  - [Step 2: Register the Padlock on GitHub.](#step-2-register-the-padlock-on-github)
  - [Step 3: Add the Private Key onto Local Machine.](#step-3-add-the-private-key-onto-local-machine)
  - [Step 4: Create Test Repo / Push changes to Test repo.](#step-4-create-test-repo--push-changes-to-test-repo)
    - [First Option](#first-option)
    - [Second Option](#second-option)
  - [Step 5: Push changes to Test repo.](#step-5-push-changes-to-test-repo)
- [Task: Re-create SSH setup to authenticate to GitHub](#task-re-create-ssh-setup-to-authenticate-to-github)
  - [Delete the SSH Key-pairs on Git Bash Termial](#delete-the-ssh-key-pairs-on-git-bash-termial)
  - [Create/Generate an SSH Key pair.](#creategenerate-an-ssh-key-pair)
  - [Register the Padlock on GitHub.](#register-the-padlock-on-github)
  - [Add the Private Key onto Local Machine.](#add-the-private-key-onto-local-machine)
  - [Update the Remote URL in Your Local Repo](#update-the-remote-url-in-your-local-repo)
    - [Test the SSH Connection](#test-the-ssh-connection)
    - [Step 1: Check your current remote URL](#step-1-check-your-current-remote-url)
    - [Step 2: Change the remote URL to use SSH](#step-2-change-the-remote-url-to-use-ssh)
    - [Making a push via SSH](#making-a-push-via-ssh)
- [Task: Change it back to HTTPS](#task-change-it-back-to-https)
  - [Test the Connection](#test-the-connection)
  - [Change it back to HTTPS](#change-it-back-to-https)
    - [Make sure there's something to push from tech264-test-git](#make-sure-theres-something-to-push-from-tech264-test-git)
    - [Making a push via HTTPS](#making-a-push-via-https)
- [Task: Use a new Git Bash window to push a change with SSH](#task-use-a-new-git-bash-window-to-push-a-change-with-ssh)
  - [Test the Connection](#test-the-connection-1)


<br>

# A Guide to Setting Up SSH Keys for Use with GitHub

<br>

## Background Information
* From your local machine, we have been able to push changes to GitHub.
* We've used HTTPS to authenticate and transfer the data to our GitHub Repos on GitHub because it's secure.

Now we're going to use SSH instead. 
* SSH key pair (public and private).
* Type: RSA (key pair). 
  * Two files are generated: 
    * Private Key: like a key.
      * This is kept on your local machine (.ssh folder). 
    * Public Key: like a padlock. 
      * This has to go on anything you want to secure. 

We need to put it somewhere else. 

<br>

## Step 1: Create/Generate an SSH Key pair. 
* We're going to do this on our local machine. 
* Git Bash window > cd .ssh > pwd (to check where you are) > enter this command: `ssh-keygen -t rsa -b 4096 -C "georgiastanley98@gmail.com"`
* File name: `tech264-georgia-github-key`
* Enter passphrase: click "Enter" twice. 
* `ls` to check it's there:
  * tech264-georgia-github-key
  * tech264-georgia-github-key.pub

<br>

## Step 2: Register the Padlock on GitHub.
* register the public key (the padlock).
* Go to GitHub Account.
* Go to Setings: SSH and GPG Keys > New SSH Key > 
* Title: tech264-georgia-github-key
  * Authentication key
* In git bash window:  `cat tech264-georgia-github-key.pub`
    * 'cat' to print the key.
* Copy entire output and paste it into the Key description.
* This allows access to all of your GitHub Repo Accounts because it's in your settings. 

<br>

![add-ssh-key](./azure-images/add-ssh-key.png)

![sshkeys](./azure-images/sshkeys.png)  

<br>

## Step 3: Add the Private Key onto Local Machine.
* Add the private key to SSH register.
* Go to the Git Bash window.
* We want to start the SSH Agent: eval `ssh-agent -s`
  * Output: Agent pid 920. 
  * Once this is running, 
* Use the SSH add command to register: `ssh-add tech264-georgia-github-key`
  * Put in your own private key name after the command.
  * Output: Identity added: tech264-georgia-github-key (georgiastanley98@gmail.com)
* Test the SSH connection to github: `ssh -T git@github.com`.
  * You may have to type 'yes' if it's your first time.
* See if we can authenticate using this private key we've just regoistered.
  * Output: Hi GP-Stanley! You've successfully authenticated, but GitHub does not provide shell access.
* Once you've registered the key, you can be anywhere in your root directory tree. 


<br>

## Step 4: Create Test Repo / Push changes to Test repo.
### First Option
* Create Repo on GitHub.
* After creation, change the HTTPS link to `SSH`.
  * e.g., git@github.com:GP-Stanley/tech264-georgia-test-ssh.git
* Create and initialise a new repo.
* Go to 'GitHub Repos' folder on local machine.
  * Make directory: `mkdir tech264-georgia-test-ssh`
  * Cd into folder: cd `tech264-georgia-test-ssh`
  * `echo "This is included in my first push" >> README.md`
  * `cat README.md`
  * `git init` 
  * `git add .`
  * `git commit -m "Added readme."`
  * `git branch -M main`
  * `git remote add origin git@github.com:GP-Stanley/tech264-georgia-test-ssh.git`
  * `git push -u origin main`
* refresh GitHub Repo: README.md should be there!

<br>

> * cd into parent folder: `cd ..`
> * remove the repo: `rm -rf tech264-georgia-test-ssh`

<br> 

### Second Option
* Go to repo
* click "Code"
* SSH link: `git@github.com:GP-Stanley/tech264-georgia-test-ssh.git`

* git clone to a different folder with the SSH link: 
  * `git clone git@github.com:GP-Stanley/tech264-georgia-test-ssh.git`


<br>

## Step 5: Push changes to Test repo.
* We do this on our local machine. 
* cd into github repos > tech264-test-git
* Double check for authentication: `ssh -T git@github.com`
* Now make sure you've made an edit to your file on visual studio code.
  * `git status`
  * `git add .`
  * `git commit -m`
  * `git push -u origin main`
  * `git status`

<br>

# Task: Re-create SSH setup to authenticate to GitHub
To consolidate what we did in our code-along:

* Delete your test repo (if you made one)
* Delete the SSH keys we made
* Do the steps again, excpert this time use a pre-existing repo, and switch it over to use SSH keys.
* Document the steps as you go, you should produce a guide to setting up SSH keys for use with GitHub.

<br>

## Delete the SSH Key-pairs on Git Bash Termial
* cd into .ssh folder
* Identify the key pair you want to delete. 
* Delete key-pair:
  * `rm -f tech264-georgia-github-key tech264-github-key.pub`
* Check again if they're there: `ls -a`. 

<br>

## Create/Generate an SSH Key pair. 
* We're going to do this on our local machine. 
* Git Bash window > cd .ssh > pwd (to check where you are) > enter this command: `ssh-keygen -t rsa -b 4096 -C "georgiastanley98@gmail.com"`
* File name: `tech264-georgia-github-key`
* Enter passphrase: click "Enter" twice. 
* `ls` to check it's there:
  * tech264-georgia-github-key
  * tech264-georgia-github-key.pub

<br>

## Register the Padlock on GitHub.
* register the public key (the padlock).
* Go to GitHub Account.
* Go to Setings: SSH and GPG Keys > New SSH Key > 
* Title: tech264-georgia-github-key
  * Authentication key
* In git bash window:  `cat tech264-georgia-github-key.pub`
    * 'cat' to print the key.
* Copy entire output and paste it into the Key description.
* This allows access to all of your GitHub Repo Accounts because it's in your settings. 

<br>

## Add the Private Key onto Local Machine.
* Add the private key to SSH register.
* Go to the Git Bash window.
* We want to start the SSH Agent: eval `ssh-agent -s`
  * Output: Agent pid 920. 
  * Once this is running, 
* Use the SSH add command to register: `ssh-add tech264-georgia-github-key`
  * Put in your own private key name after the command.
  * Output: Identity added: tech264-georgia-github-key (georgiastanley98@gmail.com)
* Test the SSH connection to github: `ssh -T git@github.com`.
  * You may have to type 'yes' if it's your first time.
* See if we can authenticate using this private key we've just regoistered.
  * Output: Hi GP-Stanley! You've successfully authenticated, but GitHub does not provide shell access.
* Once you've registered the key, you can be anywhere in your root directory tree. 

<br>

## Update the Remote URL in Your Local Repo

### Test the SSH Connection
* cd into .ssh folder
* eval `ssh-agent -s`
Agent pid 1224
* `ssh-add tech264-georgia-github-key`
* `ssh -T git@github.com`

<br>

![ssh-agent](./azure-images/ss-agent.png)

<br>

### Step 1: Check your current remote URL
* cd into `tech264-test-git`
* Check your current remote URL: `git remote -v`
  * Output: 
    * origin  https://github.com/GP-Stanley/tech264-test-git.git (fetch)
    * origin  https://github.com/GP-Stanley/tech264-test-git.git (push)

<br>

![git-remote-v](./azure-images/git-remote-v.png)

<br>

### Step 2: Change the remote URL to use SSH
* Replace the HTTPS URL with the SSH one.
* `git remote set-url origin git@github.com:GP-Stanley/tech264-test-git.git`
* To confirm the change: `git remote -v`

<br>

![url-to-ssh](./azure-images/url-to-ssh.png)

<br>

### Making a push via SSH
* cd into github repos > tech264-test-git
* Double check for authentication: `ssh -T git@github.com`
* Now make a change to your file on the visual studio code.
  * `git status`
  * `git add .`
  * `git commit -m`
  * `git push -u origin main`
  * `git status`

<br>

# Task: Change it back to HTTPS

## Test the Connection
* cd into .ssh folder
* eval `ssh-agent -s`
Agent pid 1224
* `ssh-add tech264-georgia-github-key`
* `ssh -T git@github.com`

<br>

![ssh-agent-2](./azure-images/ssh-agent-2.png)

<br>


## Change it back to HTTPS
* Open Git Bash Terminal.
* Navigate to chosen repo (e.g., tech264-test-git).
* Check your current remote URL: `git remote -v`

<br>

![git-remote-v](./azure-images/git-remote-v2.png) 

<br>

* Open GitHub and navigate to correct repo.
* Click "code" (green button).
* Copy HTTPS link.
  * * (e.g: https://github.com/GP-Stanley/tech264-test-git.git)

<br>

![test-code](./azure-images/test-code.png)

<br>

* Go back to Git Bash Terminal. 
* Replace the SSH  with the HTTPS URL .
* `git remote set-url origin https://github.com/GP-Stanley/tech264-test-git.git`
* To confirm the change: `git remote -v`

<br>

![set-url-https](./azure-images/set-url-https.png)

<br>

* Check for authentication: `ssh -T git@github.com`

<br>

![ssh-T](./azure-images/ssh-t.png)

<br>

### Make sure there's something to push from tech264-test-git
* Edit a file in tech264-test-git so you have something to push.
* 

### Making a push via HTTPS
* cd into github repos > tech264-test-git
* Double check for authentication: `ssh -T git@github.com`
* Now make a change to your file on the visual studio code.
  * `git status`
  * `git add .`
  * `git commit -m`
  * `git push -u origin main`
  * `git status`

<br>

![git-status-add](./azure-images/status-add.png)

<br>

> When you see the warning “LF will be replaced by CRLF,” it means that Git will convert the line endings from LF to CRLF the next time it processes the file. This is common when working on a project across different operating systems.

<br>

![git-commit-push](./azure-images/commit-push.png)

![git-status](./azure-images/git-status.png) 

<br>

# Task: Use a new Git Bash window to push a change with SSH
> * Once you have SSH working with GitHub, close the Git Bash window you were using
> * Open a new Git Bash window, go to your test-ssh repo and push a change - you should get a permissions error
> * Without deleting your key on your local computer or Git Hub (you know there is nothing wrong with your keys - they were working fine in the last Git Bash window), try to work out how to fix the error
> * Document/explain the steps / commands you used
> * Document using the same repo you used for Task: Document "Using SSH with GitHub"

<br>

![alt text](image.png)

![alt text](image-1.png)

<br>

## Test the Connection
* cd into .ssh folder
* eval `ssh-agent -s`
Agent pid 1224
* `ssh-add tech264-georgia-github-key`
* `ssh -T git@github.com`

<br>

![ssh-agent-2](./azure-images/ssh-agent-2.png)

<br>