# Week 5: CI/CD Pipelines with Jenkins

- [Week 5: CI/CD Pipelines with Jenkins](#week-5-cicd-pipelines-with-jenkins)
- [Task: Research CI/CD and Jenkins](#task-research-cicd-and-jenkins)
  - [What is CI? Benefits?](#what-is-ci-benefits)
    - [Benefits](#benefits)
  - [What is CD? Benefits?](#what-is-cd-benefits)
    - [Benefits](#benefits-1)
  - [Difference between CD and CDE](#difference-between-cd-and-cde)
  - [What is Jenkins?](#what-is-jenkins)
  - [Why use Jenkins? Benefits of using Jenkins? Disadvantages?](#why-use-jenkins-benefits-of-using-jenkins-disadvantages)
    - [Benefits of using Jenkins:](#benefits-of-using-jenkins)
    - [Disadvantages:](#disadvantages)
  - [Stages of Jenkins](#stages-of-jenkins)
  - [What alternatives are there for Jenkins](#what-alternatives-are-there-for-jenkins)
  - [Why build a pipeline? Business value?](#why-build-a-pipeline-business-value)
    - [Business value:](#business-value)
  - [Create a general diagram of CICD](#create-a-general-diagram-of-cicd)
  - [Understand SDLC workflow: plan, design, develop, deploy](#understand-sdlc-workflow-plan-design-develop-deploy)
- [Friday 18/10 Notes](#friday-1810-notes)
- [CI/CD Pipeline: Ramon's Diagram](#cicd-pipeline-ramons-diagram)
  - [Why build a CI/CD pipeline?](#why-build-a-cicd-pipeline)
  - [Why Jenkins?](#why-jenkins)
    - [More Detailed Benefits of Jenkins](#more-detailed-benefits-of-jenkins)
    - [What's it's business value?](#whats-its-business-value)
  - [What's going to happen in our pipeline?](#whats-going-to-happen-in-our-pipeline)
  - [There are 2 parts to our pipeline:](#there-are-2-parts-to-our-pipeline)
    - [1. Continuous Integration (CI) part:](#1-continuous-integration-ci-part)
    - [2. Continuous Deployment (CD) part:](#2-continuous-deployment-cd-part)
- [Code-Along](#code-along)
  - [Test: Making our pipeline](#test-making-our-pipeline)
  - [Run the pipeline](#run-the-pipeline)
  - [Test: Create another job/ another pipeline](#test-create-another-job-another-pipeline)
  - [Test: Make a multi-stage Pipeline: Connecting our existing pipes](#test-make-a-multi-stage-pipeline-connecting-our-existing-pipes)
- [Three Job Jenkins Pipeline](#three-job-jenkins-pipeline)
- [Ramon's Diagram: How it's going to work](#ramons-diagram-how-its-going-to-work)
  - [Jenkins CICD Pipeline with Three Jobs](#jenkins-cicd-pipeline-with-three-jobs)
  - [The Trigger to all of this.](#the-trigger-to-all-of-this)
  - [The 3 Jobs:](#the-3-jobs)
    - [**Job 1**: Testing the code on the "dev" branch.](#job-1-testing-the-code-on-the-dev-branch)
    - [**Job 2**: Merge from the "dev" branch to the "main" branch (the source of the code).](#job-2-merge-from-the-dev-branch-to-the-main-branch-the-source-of-the-code)
    - [**Job 3**: Deploy the updated code to an EC2 instance to run the uppdated code.](#job-3-deploy-the-updated-code-to-an-ec2-instance-to-run-the-uppdated-code)
      - [Deployment Method:](#deployment-method)
      - [Requirements:](#requirements)
      - [Code/Script Validation:](#codescript-validation)
    - [AWS EC2 Instance](#aws-ec2-instance)
    - [EC2 Instance will need:](#ec2-instance-will-need)
  - [Generate a New-key Pair](#generate-a-new-key-pair)
    - [Give this Key to a Specific Repo](#give-this-key-to-a-specific-repo)
    - [Get App Folder Into Repo](#get-app-folder-into-repo)
  - [Git Clone - Existing App Repo](#git-clone---existing-app-repo)
  - [Getting our Key on Jenkins](#getting-our-key-on-jenkins)
  - [We're setting up a padlock on a SPECIFIC repo: "sparta-test-app".](#were-setting-up-a-padlock-on-a-specific-repo-sparta-test-app)
  - [Job 1: pipeline](#job-1-pipeline)
  - [Set up our Webhook so we get the trigger.](#set-up-our-webhook-so-we-get-the-trigger)
    - [Go to Git Bash Window](#go-to-git-bash-window)
  - [Set up GitHub so it sends a webhook to Jenkins](#set-up-github-so-it-sends-a-webhook-to-jenkins)
- [Task: 3-job Jenkins pipeline to deploy Sparta test app](#task-3-job-jenkins-pipeline-to-deploy-sparta-test-app)
  - [Get job 2 working](#get-job-2-working)
    - [Git Publisher - Jenkins Plug In.](#git-publisher---jenkins-plug-in)
- [Improved Version of Job 2: Using Git Publisher Plug-in](#improved-version-of-job-2-using-git-publisher-plug-in)
- [Get Job 3 Working](#get-job-3-working)
  - [Copy Tested Code from Jenkins](#copy-tested-code-from-jenkins)
  - [Configure SSH Access](#configure-ssh-access)
  - [Configure Job 3](#configure-job-3)
    - [Using 'scp' Command](#using-scp-command)
    - [Using 'rsync' Command](#using-rsync-command)
  - [Ensure Dependencies / Run Commands on EC2](#ensure-dependencies--run-commands-on-ec2)
    - [SSH from Jenkins into the EC2 Instance to run the commands.](#ssh-from-jenkins-into-the-ec2-instance-to-run-the-commands)
    - [Commands we need to run:](#commands-we-need-to-run)
  - [Restart the Instance](#restart-the-instance)
  - [Connect via SSH on Git Bash](#connect-via-ssh-on-git-bash)
  - [SSH in](#ssh-in)
- [Job 3](#job-3)
    - [What your code is doing](#what-your-code-is-doing)
  - [SSH into the Instance](#ssh-into-the-instance)
  - [Nano file in Git Bash Terminal](#nano-file-in-git-bash-terminal)


# Task: Research CI/CD and Jenkins
## What is CI? Benefits?
CI stands for **Continuous Integration**. 
* It’s a practice in software development where developers frequently *merge their code changes* into a *shared repository*. 
* Each integration is *automatically tested to detect issues* early.

### Benefits
* 🪲`Early bug detection`🪲: Since code is tested every time it’s integrated, issues are caught earlier.
* 🤼`Improved collaboration`🤼: Frequent code merges help developers work better together.
* ⏩`Faster development`📈: Smaller, more frequent updates make development smoother.
* 👍🏻`Better code quality`👍🏻: Automated testing ensures that issues are fixed as soon as they arise.

<br>

## What is CD? Benefits?
CD stands for Continuous Delivery or Continuous Deployment (CDE?).

  * 🚚**Continuous Delivery**🚚: After code is integrated and tested, it’s *prepared for release* into production, but a human approval is needed before it’s deployed.
  * 📦**Continuous Deployment**☑️: It’s the automated process where code goes from testing to production *without manual intervention*.

### Benefits
* ⏩**Faster releases**⏩: Changes can be *deployed to production* more frequently.
* 📉**Reduced risks**📉: Frequent deployments with smaller changes *reduce* the chance of big *failures*.
* 🔁**Increased automation**🔁: *Saves time* by automating manual steps.
* 📝**Better user feedback**📝: New features or fixes *reach users faster*, leading to *quicker feedback*.

<br>

## Difference between CD and CDE
* **CD** (Continuous Delivery): Refers to the practice of ensuring your codebase is `always ready to deploy`. A `manual approval` step might be required before deploying to production.
  * More manual intervention and testing at different stages. 
  * Culture is built in to avoid end users experiencing bugs. 
  * They care about what their end users experience. 
  * Typically seen inbigger organisations.
  
* **CDE** (Continuous Deployment): Takes CD a step further by `automatically deploying` every change that passes the testing phase to production, `without any manual intervention`.
  * Using this depends on the culture of the organisation and the users should know about this. 
    * Faster delivery.
    * Fast feedback loop.
    * More susceptible to bugs. 
    * Typically seen in start-ups. 

<br>

| **Aspect** | **CD (Continuous Delivery)** | **CDE (Continuous Deployment)** |
|------------|------------------------------|---------------------------------|
| **Deployment Readiness** | Always ready to deploy | Always ready to deploy |
| **Approval** | Manual approval required | No manual approval needed |
| **Automation** | Partially automated | Fully automated |


<br>

## What is Jenkins?
Jenkins is an **open-source automation server** used for *automating the building, testing, and deployment* of applications. 
* It’s widely used for CI/CD (Continuous Integration/Continuous Delivery) pipelines. 
* Jenkins lets you *set up workflows* that *automatically test and deploy* code after it’s integrated.

<br>

## Why use Jenkins? Benefits of using Jenkins? Disadvantages?
Jenkins *automates repetitive tasks*, like building and testing code, to make the *development process* **faster** and more **reliable**.

### Benefits of using Jenkins:
* **Automation**: Jenkins *automates* build, test, and deployment *steps*.
* **Flexibility**: It can be *customised* to fit various project needs, thanks to its plugins.
* **Open-source**: Jenkins is *free* and has a large, *supportive community*.
* **Integrations**: *Works well with other tools* like Git, Docker, etc.

### Disadvantages:
* **Complexity**: Jenkins can be *complex to set up and manage*, especially for beginners.
* **Maintenance**: Since Jenkins is self-hosted, you’ll need to *handle updates and manage infrastructure*.
* **Performance issues**: Large projects may require *tuning to avoid performance bottlenecks*.

> “bottlenecks” refer to points in the project where the **performance is significantly slowed down or hindered**. These are areas that **limit** the overall **efficiency** and **speed** of the project, **causing delays** or **reduced performance**. 
> 
> "tuning" involves optimising these areas to ensure the project runs smoothly and efficiently.

<br>

## Stages of Jenkins
A Jenkins pipeline (B.T.D.PDA) has the following stages:

* `Build`: *Compiles* the code.
* `Test`: *Runs automated tests* to check the code quality.
* `Deploy`: Sends the code to the *next environment* (like a testing server or production).
* `Post-deploy actions`: Extra *checks or notifications after deployment* (e.g., sending an email to the team).

<br>

![stages-jenkins](./cicd-images/stages-jenkins.png)

<br>

## What alternatives are there for Jenkins
Other tools that do similar things to Jenkins include:
* GitLab CI/CD
* CircleCI
* Travis CI
* GitHub Actions
* Bamboo (by Atlassian)

<br> 

## Why build a pipeline? Business value?
A CI/CD pipeline **automates parts of the software development process**, like testing and deployment.

### Business value:
* **Faster time to market**: Automating tasks means you can *release new features* and *bug fixes faster*.
* **Higher quality**: *Consistent testing and deployment* *reduce the risk of bugs* in production.
* **Cost savings**: Automation *reduces the need for manual work*, which *saves time and money*.

<br>

![pipeline](./cicd-images/pipeline.png)

source: https://www.xenonstack.com/blog/continuous-delivery-jenkins-pipeline

<br>

## Create a general diagram of CICD
** needs uploading ** Below is an example from the internet. 

Developer -> Code commit -> CI: Build & Test -> CD: Deploy -> Production

<br>

![pipeline-comp](./cicd-images/pipeline-comps.png)

source: https://www.geeksforgeeks.org/cicd-pipeline-system-design/

![diagram-cicd](./cicd-images/cicd-diagram.png)

source: https://blog.bytebytego.com/p/a-crash-course-in-cicd

<br>

## Understand SDLC workflow: plan, design, develop, deploy
SDLC (Software Development Life Cycle) is a process followed to create high-quality software:

* `Plan`: Define what the software will do and set goals.
* `Design`: Create blueprints for how the software will look and work.
* `Develop`: Write the actual code to build the software.
* `Deploy`: Release the software to users or production.


<br>

![sdlc-cycle](./cicd-images/sdlc-cycle.png) 

<br>

![sdlc-phases](./cicd-images/sdlc-phases.png) 

<br>

---

<br>

# Friday 18/10 Notes

# CI/CD Pipeline: Ramon's Diagram

![3-job-pipe](./cicd-images/3-job-pipe.png)

## Why build a CI/CD pipeline?
* Run one command to do it all.
* Fast: done in minutes.

## Why Jenkins?
* It's industry standard: been around for a while and commonly used. 
* It's free.
* Powerful and many pluggins.
* Helps us understand the CICD concept. 

### More Detailed Benefits of Jenkins
Jenkins is a popular open-source automation server that is widely used for continuous integration and continuous delivery (CI/CD). Here are some key reasons why you might choose to use Jenkins:

  * 🔁**Automation**🔁: Jenkins automates the process of building, testing, and deploying applications, which helps to reduce manual errors and save time.
  * **Extensibility**: With over 1,800 plugins available, Jenkins can be extended to integrate with a wide variety of tools and technologies, making it highly customisable to fit different workflows.
  * 🧑‍🤝‍🧑**Community Support**🧑‍🤝‍🧑: Being open-source, Jenkins has a large and active community that contributes to its development and provides support through forums, documentation, and tutorials.
  * 📈**Scalability**📈: Jenkins can be scaled to manage large numbers of builds and tests, making it suitable for projects of all sizes.
  * 🧘🏻‍♀️**Flexibility**🧘🏻‍♀️: It supports various version control systems (like Git, SVN, and Mercurial) and can be used on different operating systems (Windows, macOS, Linux).
  * **Pipeline as Code**: Jenkins allows you to define your build, test, and deployment pipelines as code using the Jenkinsfile, which can be versioned alongside your source code.
  * **Integration**: Jenkins integrates well with other tools in the DevOps ecosystem, such as Docker, Kubernetes, and various cloud providers, enabling seamless CI/CD workflows.

### What's it's business value?
* Save time = save money.


## What's going to happen in our pipeline?
Action to trigger the pipeline.
  * `git push`
  * In order for this to work, we need to set up a `web hook`. 
> **Webhook**: a way for Jenkins to listen to the change for when that git push occurs on the development branch. 

## There are 2 parts to our pipeline:
### 1. Continuous Integration (CI) part:
1. Testing the code you've put.
2. Merge.

### 2. Continuous Deployment (CD) part:
3. Deployment. 
   * The code changes are going to get deployed to AWS. 

<br>

# Code-Along
* Go to the Jenkins dashboard using your private link and log in.

## Test: Making our pipeline
* Click on "new item" (on the left).
* Enter item name: tech264-georgia
* Click "freestyle project" and "OK".

![new-item](./cicd-images/new-item.png)

* Description: Testing Jenkins.
* Discard old builds:
  * everytime it runs, it will log it with a timestampp, date. This is called a build. 
* Give it a maximun of 5 builds. 

![discard-builds](./cicd-images/discard-builds.png)

* Scroll down to "Build Step".
* Click "Execute Shell"

![build-steps](./cicd-images/build-steps.png)

* Add a command to "Execute Shell": `uname -a`
* Click "save".

>If you want to go back and re-configure, click "Configure" on the left side of your project dashboard. 

## Run the pipeline
* On the left, click "Build Now". 
* If you go back to your "Dashboard", you will see it under "Build Executor Status".
  * It's built a node to run the jobs. 
  * Ours can only run 5 jobs at a time because that is what we've set it as. 

![build-status](./cicd-images/build-status.png)

> If you want to see your job, click on your project name. 

![project-job](./cicd-images/project-job.png)

* Click on your number next to the green tick on the bottom left. 
* Click on "Console Output" on the left side to see more details about what you've run. 

![console-output](./cicd-images/console-output.png)

>In Jenkins, nodes (or agents) are computers that run your jobs. Sometimes, these nodes can be set to turn off if they aren’t used for a while, like 10 minutes. If this happens, you might need to start your job again because the node turned off before it could run.

<br>

## Test: Create another job/ another pipeline
> Aim: to get the date and time. 
* Call it: tech264-georgia-date-time
* "Execute Shell": `date`
* Click "Build Now"
* Click on the link next to green tick on bottom left.

![build-2](./cicd-images/build-2.png)

* Click "Console Output" on the left hand side. 
* You can see within the code the command "date" and the output underneath. 

![console-output](./cicd-images/console-output1.png)

<br>

## Test: Make a multi-stage Pipeline: Connecting our existing pipes
> Aim: Link our two pipes together. 
>
> We need to make sure the pipe/projects go in order: uname -a > date. 
* Go to "Dashboard".
* Go to the **first project**: tech264-georgia
* Go to "Configure".
* Go to "Post-build Actions": "build other projects" > `tech264-georgia-get-time`
* Click "trigger only if build is stable". 
* Click "OK" (or save).
  
![build-actions](./cicd-images/build-actions.png)

* Click "Build Now".

![build-history](./cicd-images/build-history.png)

* Go to Dashboard and click on your **first** project.
* Click on "#2" (or most recent) build.
* Click "Console Output". 

![console-output2](./cicd-images/console-output2.png)

> You need to click on the number of the build to get the console output for that node. 

<br>

# Three Job Jenkins Pipeline

# Ramon's Diagram: How it's going to work

![3-job-diagram](./cicd-images/3-job-diagram.png)

## Jenkins CICD Pipeline with Three Jobs
Starting with Jenkins.
* Jenkins is made up of two things:
  * A built in (master) node. 
  * The (master) node uses **agent** nodes to run the jobs. 
* We'll be using the built in node to build and manage jobs. 

> Our pipeline does not have agent nodes currently because we haven't created them.

<br>

## The Trigger to all of this. 
* You (the developer) will be working on the code. 
  * The individuals writing the code.
  * Not necessarily a DevOps engineer doing this work.

* You do your `git push` on the "dev" branch via Git Bash terminal. 
  * Ways to do that:
    * SSH
    * HTTPS

* This `git push` will be sent to our GitHub repo. 
  * We will set up on GitHub so that when we make changes on the branch, Jenkins will be notified of this. This is the **webhook**.
  * It'll basically say that there have been changes on the "dev" branch. 
  * For Jenkins to do it's job, it needs to be listening. 
  * When it gets the notification, Jenkins will trigger the pipeline. 

<br>

> **webhook**:'s are commonly used in modern day. 
> - More efficient. 
> - Jenkins tells you when it's ready. 
>
> Historically they used "**polling**". 
> - Regular intervals of asking "has this happened yet" unti finally it's a yes. 
>- This is a wind up.

<br>

* We currently have our agent node running our jobs.

## The 3 Jobs:
These are going to run in order if the previous result is succesful.
### **Job 1**: Testing the code on the "dev" branch. 

### **Job 2**: Merge from the "dev" branch to the "main" branch (the source of the code). 
   * Use an SSH Key-pair to do the merge. This will be used to authenticate the connection.
   * Jenkins will need the private key to do the merge. 

### **Job 3**: Deploy the updated code to an EC2 instance to run the uppdated code. 

> How is the code going to get deployed to the EC2 instance?

#### Deployment Method:

* We will use SSH for deployment.
* Jenkins will SSH into our EC2 instance using scp.

#### Requirements:
* Jenkins needs a copy of our private key to access the EC2 instance.
  * Ensure Jenkins can authenticate using the private key.
  * Provide the private key on the Jenkins server.

#### Code/Script Validation:
* Use a tested and successfully passed script in your pipeline.
* Use src or rsync for deployment, not git clone.


<br>

### AWS EC2 Instance
> The AWS EC2 instance will already be running before the pipeline runs. 

* Jenkins needs to be able to SSH into this EC2 instance to deploy the updated code. 
  * To do this it needs to authenticate with the private EC2 key `.pem` file. 

> This is what Job 3 will have to do. 
>   * Copy the updated code. 
>   * Restart the app. 
>   * It will have to `npm install` to be sure it can re-install that new code. 

### EC2 Instance will need:
> All of the pre-configs that we've done (all of the dependencies for the app to run).

## Generate a New-key Pair
* Open Bash windown.
* cd into .ssh folder.
* Command: `ssh-keygen -t rsa -b 4096 -C "georgiastanley98@gmail.com"`
* Enter file: georgia-jenkins-2-github-sparta-app
* Passphrase: press "Enter" twice. 
* `ls`: to check if the keys have been generated. 

![keygen](./cicd-images/keygen.png)
![ls-keygen](./cicd-images/ls-keygen.png)

<br>

### Give this Key to a Specific Repo
* Go to GitHub and create a new repo called: sparta-test-app
* Go to GitHub Repo folder on Git bash.
* ` git clone <repo link>`
* `ls`: to check it's there. 
* cd into the folder: "sparta-test-app".

![gitclone](./cicd-images/gitclone.png)

> move the app folder into here. 

### Get App Folder Into Repo
* Copied from the file explorer into this repo (this can take a minute). 

> 💥This copied an empty file.💥
>
> What I've done now is git clone from an old repo with a working app folder within and rename it. 

## Git Clone - Existing App Repo
* `cd` into GitHub Repo folder (where you want to place your repo).
* Clone using the https github link from your chosen repo you want to clone. 
  * In the same line, name the repo. 
  * `git clone "https link" "tech264-sparta-test-app-cicd"`
* Check the repo via `ls`. 
* `cd` into your cloned repo: `cd tech264-sparta-test-app-cicd`.
* Check inside the folder to make sure the 'app' folder is there: `ls`.
* Set the remote URL for the repository: `git remote set-rul origin "https link"`.
* Check the remote URL configuration: `git remote -v`
* Push any changes to the remote repository: `git push`

![clone-existing](./cicd-images/clone-existing.png)

<br>

## Getting our Key on Jenkins
* We need to use the public key on the repo. 
* The private key will be used on Jenkins so it can have access to the repo and merge our changes. 

## We're setting up a padlock on a SPECIFIC repo: "sparta-test-app".
This can only be done ONCE per public key. 
* Go to selected repo on GitHub. 
* Go to repo settings > Security > Deploy keys
* "Add deploy key"
* Title (this can be the same as name of your public key): georgia-jenkins-2-github-sparta-app
* Print it out in Git Bash window: `cat georgia-jenkins-2-github-sparta-app.pub`
  * Copy and paste this into the Key description. 
* Allow write access. 

![deploy-keys](./cicd-images/deploy-keys.png)

![print-key](./cicd-images/print-key.png)

<br>

## Job 1: pipeline
Log in to Jenkins.
* Click "New Item".
* Name: "georgia-job1-ci-test"
* Click "Freestyle Project"
* Click "OK".
* Description: "Test app code for job 1"
* Discard old builds > 5
* Click "GitHub project"
* "Project url": 
  * Go to repo on GitHub.
  * Copy HTTPS code: https://github.com/GP-Stanley/sparta-test-app/
> MAKE SURE THERE'S NO ".git" on the end!
>
> ^ This will make the build fail. 
* "Source code management" > "Git" > 

![https-link](./cicd-images/https-link.png)

  * Grab SSH code from GitHub repo: git@github.com:GP-Stanley/sparta-test-app.git

![ssh-link](./cicd-images/ssh-link.png)

<br>

* Go back to Jenkins. 
* Add credentials to private key > "Jenkins" >
* "Kind" > SSH Username with Private Key > 
* "ID":  georgia-jenkins-2-github-sparta-app 
  * If you see "unacceptable characters", check there's not a space at the end. 
* Click "Enter directly" > paste in private key
* Git Bash window: cat "private key name"
  * Copy ALL of this code (including the heiphens) and paste it into the Jenkins "Key Description". 
* Click "Add".

![ssh-username](./cicd-images/ssh-username.png)
![priv-key](./cicd-images/priv-key.png)

<br> 

* "Branches to build"
* Change to `*/main`

![branch-main](./cicd-images/branch-main.png)
![trigger](./cicd-images/trigger.png)

* "Build Environment" > 
* "Click": "Provide Node & npm bin/ folder to PATH"
  * Use `version 20`.

![version20](./cicd-images/version20.png)

* "Build Step"
* "execute shell"
* Add in code:
  * cd app
  * npm install
  * npm test
* Click "Save". 

![job1-shell](./cicd-images/job1-shell.png)

* Click "Build Now".
* Go to Dashboard to see what's happening. 
* Should have a green tick if it's done! (this may take a time).

<br>

## Set up our Webhook so we get the trigger. 
* Job 1: edit and listen for the webbhook.
* Go to configuration > change branch to "*/dev" > 
* Build triggers > Check "GitHub hook trigger for GITScm polling".
  * This will make Jenkins listen out for the web hook.

<br>

### Go to Git Bash Window
1. Open Git Bash and Navigate to the Repository:
   * Use `ls` to list the contents of the repository directory and ensure the “app” folder is present.
2. Create a New Branch:
   * Use `git branch dev` to create a new branch named dev.
3. Switch to the New Branch:
   * Use `git switch dev` to switch to the dev branch.
4. Edit the README.md File:
   * Open the README.md file using the `nano` text editor.
   * Add a new line with the text “a new line to test webhook”.
   * Save the changes with `Ctrl+s` and exit the editor with `Ctrl+x`.
5.  Stage the Changes:
    * Use `git add .` to stage all changes in the repository.
6.  Commit the Changes:
    * Use `git commit -m "Added line to readme."` to commit the changes with a message.
7.  Push the Changes to the Remote Repository:
    * Use `git push --set-upstream origin dev` to push the changes to the dev branch on the remote repository and set the upstream branch.
8. If you go onto GitHub, you should see your pushes from the "dev" branch. 

These steps help you create a new branch, make changes to a file, and push those changes to the remote repository, ensuring your work is tracked and shared with others.

![dev-github](./cicd-images/dev-github.png)

<br>

## Set up GitHub so it sends a webhook to Jenkins
* GitHub Repo > Settings > Webhooks > Add webhook
* "Payload URL": Jenkins URL. `http://34.254.6.118:8080/`
  * One the end, put: `github-webhook/`
* "Which events would you like to trigger this webhook?": keep it on "just the push event". 
* Click "Add Webhook". 

![webhooks](./cicd-images/webhooks.png)
![webhooks1](./cicd-images/webhooks1.png)

<br>

# Task: 3-job Jenkins pipeline to deploy Sparta test app
Pre-requisites: You already have: ✅
  * Job 1 <yourname>-job1-ci-test working

Get Job 2 working:✅
* Name Job 2: similar to <yourname>-job2-ci-merge
* Create a dev branch on your local git repo sparta-test-app-cicd
* Make a change to dev branch and push the code to GitHub - the webhook needs to trigger the pipeline
* If the tests pass on Job 1, Job 2 should run (and the code should merge from dev to main branch)

Get Job 3 working:
* Name Job 3: similar to <yourname>-job3-cd-deploy
* Copy the updated & tested code from Jenkins to the AWS EC2 instance
* Jenkins will need to SSH into the EC2 instance to update the code & re-run the app
* Only 1 person needs to add the key/SSH credentials/pem file on Jenkins for Job 3
* To copy the code from Jenkins to to EC2, use the scp or rsync commands from Jenkins
  * DO NOT: git clone from main branch and push to production
* You will need an EC2 instance already running
  * Should use normal Ubuntu 18.04 LTS image
  * Use normal SG rules, but allow Jenkin's IP to SSH in
  * Must have all dependencies installed to run Sparta test app

<br>

## Get job 2 working
* Name: "georgia-job2-ci-merge"
* Freestyle project
* Click "OK". 
* Description: 

Git project > project url : "https://github.com/GP-Stanley/sparta-test-app/"

![repo-url](./cicd-images/repo-url.png)

Build triggers > build after other projects are built > enter job1 > trigger only if built is stable > GitHub hook trigger for GITsm polling. 

![build-triggers](./cicd-images/build-triggers.png)

Build steps > execute shell > Command > "georgia-job1-ci-test"
  * git switch main
  * git merge origin/dev
  * git push origin main 

> BEST PRACTISE A better way to do it:
>
> * Use a Jenkins plug in to do what you need it to do in terms of commands, (Use a Jenkins plug-in to do the commands). 
>
>   * e.g., 

<br>

### Git Publisher - Jenkins Plug In.
* The git plugin provides fundamental git operations for Jenkins projects. 
  * It can poll, fetch, checkout, branch, list, merge, tag, and push repositories.

Source: https://plugins.jenkins.io/git/#plugin-content-merge-extensions

![git-publisher](./cicd-images/git-publisher.png)

![git-publisher](./cicd-images/git-publisher1.png)

<br>


![build-triggers2](./cicd-images/build-triggers2.png) 

* Build Environment > SSH agent > Add Key. 

![ssh-agent](./cicd-images/ssh-agent.png)

* Console Output. 

![console-output3](./cicd-images/console-output3.png)

> Make changes to README.md and push them, if you go onto jenkins, you will see your two jobs working.

* Make sure you're on the "dev" branch.
* Make an edit: `nano README.md`
* `git add .`
* `git commit -m "Testing job 2."`
* `git push`

![test-push](./cicd-images/test-push.png)

* Go to the GitHub repo and refresh. 

![github-ubuntu](./cicd-images/github-ubuntu.png)

> `git switch main` to get onto the main branch again. 

<br>

# Improved Version of Job 2: Using Git Publisher Plug-in
* Go to job 2 on Jenkins. 
* Use Git Publisher instead of Git Commands. 
* Delete contents of Execute Shell. 
* Open post-build actions >
* branch to push > dev
* target remote name > origin

![git-publisher](./cicd-images/git-publisher3.png)

![post-git-publisher](./cicd-images/post-git-publisher.png)

![alt text](./cicd-images/branches.png)

> THIS NEEDS TO BE CHECKED. 

<br>


# Get Job 3 Working
> You will need both Jenkins and AWS.

## Copy Tested Code from Jenkins
* Copy the updated & tested code from Jenkins to the AWS EC2 instance
  * Code in job 1: 
> cd app 
> 
> npm install
> 
> npm test
  
  * Code in job 2: 
> git switch main
> 
> git merge origin/dev
> 
> git push origin main

<br>

## Configure SSH Access
* Jenkins will need to SSH into the EC2 instance to update the code & re-run the app.

> Only 1 person needs to add the key/SSH credentials/pem file on Jenkins for Job 3

* Ensure you have an EC2 instance running Ubuntu 22.04 LTS.
* Allow Jenkins’ IP to SSH into the EC2 instance by updating the security group rules.
* Add the SSH credentials (pem file) to Jenkins:
  * Go to **Manage Jenkins** > **Manage Credentials**.
  * Add a new SSH credential with the private key from your pem file.

![job3-execute](./cicd-images/job3-execute.png)

<br>

## Configure Job 3
* To copy the code from Jenkins to to EC2, use the scp or rsync commands from Jenkins
**DO NOT**: git clone from main branch and push to production

### Using 'scp' Command
* In the job configuration, add a build step to execute a shell command.
* Use scp or rsync to copy the code from Jenkins to the EC2 instance. 

`scp -i /path/to/your-key.pem /path/to/your-code.zip ec2-user@your-ec2-ip:/path/to/destination/`

### Using 'rsync' Command
* In the job configuration, add a build step to execute a shell command.
* Use scp or rsync to copy the code from Jenkins to the EC2 instance. 

`rsync -e "ssh -i /path/to/your-key.pem" -av /path/to/your-code/ ec2-user@your-ec2-ip:/path/to/destination/` 

<br>

## Ensure Dependencies / Run Commands on EC2 
* You will need an EC2 instance already running.
  * Should use normal Ubuntu 22.04 LTS image.
  * Use normal SG rules, but allow Jenkin's IP to SSH in.
  * Must have all dependencies installed to run Sparta test app.

### SSH from Jenkins into the EC2 Instance to run the commands. 
* Copied prov-app script into EC2 Instance user data. 

### Commands we need to run:
* cd into app folder.
* stop the app from running.
* install any new packages/updated code. 
* re-run the app. 

<br>

## Restart the Instance
* After copying the code, SSH into the EC2 instance to update the code and restart the application.

---

## Connect via SSH on Git Bash
* cd into your .ssh folder. 
ssh -i "tech264-georgia-aws-key.pem" ubuntu@ec2-3-253-103-76.eu-west-1.compute.amazonaws.com

<br>

 ## SSH in
 * Give yourself permission for the key: `chmod 400 tech264-georgia-aws-key.pem`

<br>

# Job 3 
* Make sure you're app script is working. 
* 

Execute shell:
```bash
rsync -avz -e "ssh -o StrictHostKeyChecking=no" app ubuntu@3.254.199.107:~

ssh -o StrictHostKeyChecking=no ubuntu@3.254.199.107 <<EOF

  pm2 stop all
  cd app
  npm install
  pm2 start app.js
EOF
```

![working-app](./cicd-images/working-app.png) 

<br>

### What your code is doing
`rsync -avz -e “ssh -o StrictHostKeyChecking=no” app ubuntu@3.254.199.107:~`
* `rsync`: A utility for efficiently transferring and synchronizing files between a local and a remote system.
* `-a`: Archive mode, which preserves permissions, timestamps, symbolic links, etc.
* `-v`: Verbose mode, which provides detailed output of the transfer process.
* `-z`: Compresses file data during the transfer to save bandwidth.
* `-e “ssh -o StrictHostKeyChecking=no”`: Specifies the remote shell program to use (in this case, SSH) and disables strict host key checking to avoid manual confirmation of the remote host’s key.
* `app`: The source directory or file to be transferred.
* `ubuntu@3.254.199.107:~`: The destination, where ubuntu is the username and 3.254.199.107 is the IP address of the remote server. The ~ indicates the home directory of the ubuntu user on the remote server.

`ssh -o StrictHostKeyChecking=no ubuntu@3.254.199.107 <<EOF`
* `ssh -o StrictHostKeyChecking=no`: Connects to the remote server via SSH, again disabling strict host key checking.
* `ubuntu@3.254.199.107`: The remote server’s username and IP address.
* `<<EOF`: Indicates the start of a here document, which allows you to pass a block of commands to be executed on the remote server.

The block of commands within the here document:
* `pm2 stop all`: Stops all processes managed by PM2, a process manager for Node.js applications.
* `cd app`: Changes the directory to app.
* `npm install`: Installs the necessary Node.js dependencies specified in the package.json file.
* `pm2 start app.js`: Starts the app.js application using PM2.

In summary, this script **transfers the app directory to a remote server**, then **connects to that server to stop any running Node.js applications**, **install dependencies**, and **restart the application**. This is a common workflow for deploying updates to a Node.js application on a remote server.

<br>

## SSH into the Instance
* `ssh -i "tech264-georgia-aws-key.pem" ubuntu@ec2-3-254-199-107.eu-west-1.compute.amazonaws.com`
* cd into the repo/app and `pm2 start app.js`.

![stop-all](./cicd-images/stop-all.png)

<br>

## Nano file in Git Bash Terminal
* Go to " ~/OneDrive - Sparta Global/Documents/GitHub Repos/tech264-sparta-test-app-cicd/app/views (dev)" (wherever you want to make your changes).
* Switch from main branch to dev branch - `git switch dev`.
* `nano index.ejs`

![pm2-stop-all](./cicd-images/pm2-stop-all.png)

* Git add > commit > push > git status. 

![nano-index](./cicd-images/nano-index.png)

* If all jobs are successful, you should see on your Jenkins Dashboard the builds happening in real time. 
* Once you are done with the "dev" branch, check if there are any commits left. If not, switch back to the main branch. `git switch main`




