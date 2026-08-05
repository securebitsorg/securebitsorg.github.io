---
title: Automatic updates of Debian with a Bash script
description: Automated updates on a Debian-based OS with a Bash script
date: 2025-08-15T08:57:42.002Z
tags:
  - bash
  - debian
  - linux
categories:
  - Linux
  - Tutorials
menu:
  sidebar:
    name: Bash script for automatic updates under Debian
    identifier: debian-update
    parent: linux-scripting
keywords:
  - bash-update-script
preview: ../../../../assets/images/posts/linux/bash-update-script-debian.webp
hero: /images/posts/linux/bash-update-script-debian.webp
---
## Automating updates on Debian-based systems with a Bash script

In this short tutorial, I would like to show you how you can use a Bash script to update Debian-based server systems automatically.

## Why use a Bash script?

I think every administrator appreciates the benefits of using scripts to automate recurring tasks, which makes their productive work far more efficient.

That is why I thought I would introduce you to Bash scripting a little in this tutorial and show you scripting in the shell using an example.
As an example, I will write a script that lets updates of Debian-based operating systems run completely automatically.

## Creating the Bash script for automatic updates

<!-- FM:Snippet:Start data:{"id":"Warning","fields":[]} -->
{{< alert type="warning" >}}
**Warning**

Please always test Bash scripts on **test systems** first and only then roll them out on production systems!!!
{{< /alert >}}
<!-- FM:Snippet:End -->

## About the structure of this example script
First, I will explain the **individual command sections** of the Bash script one after the other, along with their meaning and how they work. Further down in this article you will then find the finished update script, free for you to use.
<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
In my GitHub repository you will find many more practical scripts for Bash or for scripting with Python.

[**--> Click here for the repository**](https://github.com/securebitsorg/community-templates)

{{< /alert >}}
<!-- FM:Snippet:End -->

#### What do you need to create a Bash script?
All you really need to create a Bash script is a simple text editor.
It is better, however, to use an editor that also supports syntax highlighting for Bash scripting. That makes it easier to keep the correct formatting for the script and also gives you a better overview.

##### Here is a small selection of editors for Linux:
- KWrite
- VSCode
- nano
- VIM
- NEOvim
- Kate


### Creating the Bash script file
Before we can start writing the Bash script for our update routine, we first need a script file.
To create this Bash script file, create a new file with the extension **`.sh`** using the **nano editor** or the editor of your choice.

**In this example we create the script in the home directory of the `root user`**

>
> #### Installing the **nano editor**
>
> On Debian-based distros the **nano editor** is pre-installed in most cases. If that is not the case (for example with a minimal Ubuntu server installation), you can simply install it afterwards with this command.
>
>```sh
># Installing the nano editor
>
>sudo apt update
>
>sudo apt install nano
>```
### Step 1 - Creating a Bash script file
In this example I am using the `nano editor` in the terminal for simplicity's sake, since it is easy to operate and is available for all distros (as far as I know).

```sh
# If you are not logged in as root user, you can log in as root user with the following command

sudo -s

# Create the script file in the root directory
touch ~/simple_update_debian_script.sh

# Edit the script file
nano ~/simple_update_debian_script.sh
```
In the editor window for the file `simple_update_debian_script.sh` that is now open, enter the following in the first line:

`#!/bin/bash`

> With this first line `#!/bin/bash` we declare that this is a Bash script, so the operating system knows which interpreter (shell) should be used to execute our script.

### Step 2 - Adding Bash script comments and instructions
#### Why create comments and instructions?
In general, you should get into the habit of documenting the Bash scripts you create right from the start.

Firstly, it helps you yourself: once you have a large number of Bash scripts in your toolbox, it lets you remember later on what functionality a given script provides.

Secondly, it is of course an advantage that others can make sense of the Bash script as well, if you share your scripts internally or on GitHub etc. with other users.
#### Inserting comments or instructions
For my part, I always write the version number (for the version history) at the beginning of my scripts, along with a description of what the script is intended for and instructions on how to use it.

I also add a short label and the type of function to the individual commands executed in the Bash script whenever I share them with third parties.

**This is what it looks like:**

```bash
#!/bin/bash

# Version: 1.0

# Info:
# This script is intended for Debian-based systems.
# It updates the system and removes unused packages.
# It checks if a system restart is required and restarts the system IMMEDIATELY if necessary.
# It is important that the script is run as root.

# Using:
# sudo chmod +x simple_update_debian_script.sh
# sudo ./simple_update_debian_script.sh



# Automatic update script for Debian-based systems
```

### Step 3 - `echo` output in the terminal window
To give the user of the Bash script feedback about what is currently being carried out while the script runs, there is the `echo` command for printing to the terminal.

In our example script we use the `echo` command for the first time to pass a message to the user in the terminal, informing them what this script is now going to do on the system.

```bash
echo "================================================================="
echo "                    Automatic system update"
echo "                     (Debian/Ubuntu/Mint)"
echo "================================================================="
```
### Step 4 - Bash statement `if, then, fi` (check root privileges)
The first statement we are going to add to our Bash update script is the check for whether we have `root privileges` to execute the commands on the system.

```bash
# Check if root privileges are present
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (sudo)."
  exit 1
fi
```

For this we use the `if, then, fi` statement.
In plain words this means: **'if (`if`)' "the user ID is not equal to 0 `[ "$EUID" -ne 0 ];` (root user)", 'then (`then`)' print a message in the terminal (`echo`) saying "Please run this script as root (sudo)." and terminate the script (`exit 1`, which stands for "script terminated with an error or a special status"). The command `fi` ends the statement.

### Step 5 - Bash statement (check package manager)
In this step we perform another system check to verify whether the package manager `apt` is present on the system.

```bash
# Check if apt is available
if ! command -v apt >/dev/null 2>&1; then
  echo "No 'apt' package manager found. This script only works on Debian-based systems."
  exit 2
fi
```


<!-- FM:Snippet:Start data:{"id":"Info","fields":[]} -->
{{< alert type="info" >}}
```bash
if ! command -v apt >/dev/null 2>&1;
```
This checks whether the `apt` command is available on the system.
{{< /alert >}}
<!-- FM:Snippet:End -->

### Step 6 - Bash statement (update package sources)
In this step we first print output (`echo`) to the terminal stating that the package sources are being updated.
Then the command `apt update -y` is executed to carry out the announced update of the package sources.

```bash
# Update package sources
echo "Update package sources"
apt update -y
```

### Step 7 - Bash statement (update the Debian system)
Now we use the `echo` statement again to show the following output in the terminal: "Install available updates", followed by the terminal command `apt upgrade -y` to update the Debian system.

```bash
# Install available updates
echo "Install available updates"
apt upgrade -y
```

### Step 8 - Bash statement (resolve dependencies)
To also resolve dependencies during the upgrade process – for example when moving up to a new version – we run the following terminal command in our Bash update script as well.

```bash
# Optional full upgrade (including removals/reinstallations)
echo "Run full upgrade"
apt full-upgrade -y
```

### Step 9 - Bash statement (remove unnecessary apt packages)
Next we add a statement to automatically delete unnecessary `apt` packages that are no longer needed.

```bash
# Remove unused packages
echo "Remove unused packages"
apt autoremove -y
```

### Step 10 - Bash statement (clear the apt cache)
Last but not least, we add one final statement to the update process to clear the package manager's cache.

```bash
# Clean up cached package data
echo "Clean up cached package data"
apt clean
```

### Step 11 - Bash statement (echo output: update process completed)
Since the update process is finished after the previous statements, we send one more message to the user in the terminal to say that the update process has come to an end.

```bash
echo "================================================================="
echo "                   System update completed"
echo "================================================================="
```

### Step 12 - Bash statement (check whether a reboot is required)
Since some updates (for example changes to the kernel) require a restart of the operating system, we add one final statement to check for this and trigger a restart if necessary.

```bash
# Check if a system restart is required
if [ -f /var/run/reboot-required ]; then
  echo "A system restart is required. The system will now restart."
  reboot
fi
```

#### Saving the Bash update script
> After a final check of our script we of course have to save it!

## The finished Debian update Bash script
Here is the finished Bash script for running update routines on Debian systems automatically.

You can then have it run automatically on your Linux systems as a cron job.

<!-- FM:Snippet:Start data:{"id":"Success","fields":[]} -->
{{< alert type="success" >}}
Especially if you have a large number of Linux servers running on a Proxmox VE server, for example, Bash scripts like this make your work enormously easier.
{{< /alert >}}

<!-- FM:Snippet:End -->

```bash
#!/bin/bash

# Version: 1.0

# Info:
# This script is intended for Debian-based systems.
# It updates the system and removes unused packages.
# It checks if a system restart is required and restarts the system IMMEDIATELY if necessary.
# It is important that the script is run as root.

# Using:
# sudo chmod +x simple_update_debian_script.sh
# sudo ./simple_update_debian_script.sh



# Automatic update script for Debian-based systems

echo "================================================================="
echo "                    Automatic system update"
echo "                     (Debian/Ubuntu/Mint)"
echo "================================================================="

# Check if root privileges are present
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root (sudo)."
  exit 1
fi

# Check if apt is available
if ! command -v apt >/dev/null 2>&1; then
  echo "No 'apt' package manager found. This script only works on Debian-based systems."
  exit 2
fi

# Update package sources
echo "Update package sources"
apt update -y

# Install available updates
echo "Install available updates"
apt upgrade -y

# Optional full upgrade (including removals/reinstallations)
echo "Run full upgrade"
apt full-upgrade -y

# Remove unused packages
echo "Remove unused packages"
apt autoremove -y

# Clean up cached package data
echo "Clean up cached package data"
apt clean

echo "================================================================="
echo "                   System update completed"
echo "================================================================="

# Check if a system restart is required
if [ -f /var/run/reboot-required ]; then
  echo "A system restart is required. The system will now restart."
  reboot
fi

# End of script

```

### Step 13 - Making the Bash update script executable
In order to use / execute the Bash update script, the script still has to be given the appropriate permissions.

**Adjust the script permissions**

```sh
# Adjust the script permissions

sudo chmod +x simple_update_debian_script.sh

```

**Running the Bash update script**

```sh
# Option 1: Executing the Bash script

sudo sh simple_update_debian_script.sh

# Option 2: Executing the script

sudo ./simple_update_debian_script.sh

```

---
<!-- FM:Snippet:Start data:{"id":"Vertical Space","fields":[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->


> ## Books on Bash (shell) scripting
> ---
> **I can recommend two really good books on shell scripting here, and I own both of them myself.**
>
> Both are great reference and practice books, and for **an extra 5 €** you get the matching **e-book as well** (*only when ordering directly from Rheinwerk-Verlag*)!
>
> *Please note: both books are written in German.*
>
>> *Note: both links are affiliate links, but they do not cost you a 'cent' more and you automatically support this blog.*

{{< vs 3>}}

{{< split 6 6 >}}


**Scripting | Das Praxisbuch für Administratoren und DevOps-Teams**

![Scripting](/images/affiliate/Scripting.webp)

[Take a look at Rheinwerk-Verlag](https://www.rheinwerk-verlag.de/shell-programmierung-das-umfassende-handbuch/?GPP=securebits)

**From the contents:**


   - Bash, ZSH and the Linux toolbox
   - PowerShell and cmdlets
   - Python and Pip
   - SSH, VSCode, Git, Curl: the toolbox for modern scripts
   - Running scripts automatically: cron and Task Scheduler
   - Automating backups
   - Processing images
   - Monitoring: evaluating log files
   - Web scraping and mining
   - Scripting in the AWS cloud
   - Scripts in Docker containers

---
**Shell-Programmierung | Das umfassende Handbuch**

![Shell-Programmierung](/images/affiliate/Shell-Programmierung.webp)

[Take a look at Rheinwerk-Verlag](https://www.rheinwerk-verlag.de/scripting-das-praxisbuch-fuer-administratoren-und-devops-teams/?GPP=securebits)



**From the contents:**

  -  Introduction to the shells
  -  Variables, parameters and arguments
  -  Control structures, functions and signals
  -  Input/output in the terminal
  -  Troubleshooting and debugging
  -  Regular expressions and grep
  -  The stream editor sed
  -  Programming with awk
  -  GUIs with zenity
  -  Overview of shell commands
  -  Scripts for system administration, backup and more

{{< /split >}}

---
{{< vs 3>}}

## Conclusion on Bash scripting
In my opinion, anyone who has to administer several Linux servers efficiently cannot get around Bash or Python scripting.

Of course there are also powerful tools such as [**Ansible**](https://docs.ansible.com/ansible/latest/index.html) for automating deployment, maintenance and so on, but learning a scripting language is in my view the best place to start.

<!-- FM:Snippet:Start data:{"id":"Help deutsch","fields":[]} -->
> ## Questions and answers
>
> If you have questions or feedback about this blog or the YouTube channel, please use my help page. There you will find questions and answers about the various articles. You are also welcome to post your own question there.
>
> [**Go to the help page**](https://forum.secure-bits.org)
<!-- FM:Snippet:End -->
