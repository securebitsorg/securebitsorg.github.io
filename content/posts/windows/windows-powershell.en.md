---
title: Install Windows PowerShell
date: 2019-11-07
categories:
  - Tutorials
  - Windows
  - Linux
tags:
  - tutorials
  - windows
  - powershell
  - linux
description: Install Windows Powershell on Windows, macOS, and Linux
preview: ../../../assets/images/posts/windows/Windows-PowerShell-Batch.jpg
menu:
  sidebar:
    name: Install Windows Powershell on Linux and Windows
    identifier: powershell-linux
    parent: Windows
keywords:
  - powershell
hero: /images/posts/windows/Windows-PowerShell-Batch.jpg
---
In this article, I would like to introduce you to the new (well, not that new) command line tool Windows PowerShell and show you the differences between it and the classic CMD command line. In this article, you will learn why PowerShell should be your tool of choice for administration.
 
> You can find out what the classic command line interpreter CMD is all about in this article: [**CMD commands at a glance**](https://secure-bits.org/en/posts/windows/cmd-befehle-im-ueberblick/)


## Installing Windows PowerShell – A powerful tool
Windows PowerShell is a framework that provides administrators and power users with an indispensable tool for automating and managing cross-platform systems. This framework consists of a command line interpreter and a scripting language.
This Windows command line shell is based on the .NET Framework Common Language Runtime (CLR) and .NET Framework and uses the concept of a cmdlet (pronounced “command-let”).
These individual cmdlets (for example, for Azure services and Office 365) can be combined with each other, making them very powerful for performing complex tasks.
### Windows PowerShell versions
Windows PowerShell is available in two different versions. The first version, PowerShell “Legacy,” is based on the current .Net Framework and is currently available in build version 5.1 with a full command set.
The second version is called PowerShell “Core” and is platform-independent and based on .Net Core, but has a limited command set. The current build version 6.1 (at the time of this post) is available here.
### Difference between Windows PowerShell and CMD
The difference that is immediately noticeable when the two command prompts are started is the different background color. Here, the PowerShell command prompt has a blue background and the good old CMD command line has a black background. This allows you to immediately see which command prompt you are currently using. 

![CMD batch](/images/posts/windows/CMD-Batch.jpg)
CMD batch
![Windows PowerShell](/images/posts/windows/Windows-PowerShell-Batch.jpg)
Windows PowerShell batch
### Why a new command line?
PowerShell will replace the CMD command line in the future, as it has a wider range of functions and can be expanded (cmdlets).
PowerShell is generally essential for system administration, as certain settings can only be implemented using the shell. This is the case, for example, when administering larger Office 365 deployments (creating users via CSV, etc.).
Unlike most command line shells, which accept and return text, Windows PowerShell accepts .NET Framework objects and relies on the .NET Framework Common Language Runtime (CLR) and the .NET Framework. This change meant that a new command line tool was required for this application, and so Windows PowerShell was created.
The combination of cmdlets gives this shell a very powerful range of functions and, by using the Windows PowerShell Core version, it can also be used across systems, for example to operate Linux.

## CMD commands at a glance
In this article, I will discuss the command line tool “CMD” and provide an overview of the most commonly used and most important commands for the console. Of course, this is also available as a PDF download for you.
Just take a look...
[Read article](/posts/windows/cmd-befehle-im-ueberblick/)
* * *
## Installing Windows PowerShell
Most Windows operating systems (Windows 7 SP1 and Windows Server 2008 R2 SP1 or later) already have a version of Windows PowerShell installed. This is updated via Windows Update, or you can manually trigger an update via the command line (see below for instructions).
### Launching Windows PowerShell
Launching PowerShell is easy in all versions of Windows Desktop. Simply click on the Windows logo or magnifying glass icon on your desktop and enter “PowerShell” in the search field.
To open the Windows script editor “PowerShell ISE,” you also need to click on the Windows logo or magnifying glass icon and enter “ISE” in the search field.
### Opening Windows PowerShell on Windows Server and Windows Server Core
In the Server Core version, simply enter “powershell” in the input window after logging in to the server and confirm with the Enter / Return / Enter key. To close the console window, enter “exit”.
## Installing Windows PowerShell Core on Windows
Important!
Installing Windows PowerShell – The following requirements must be met before installation.
Universal C Runtime must be installed on all systems prior to Windows 10. This can be installed via the update or directly via download.
On systems such as Windows 7 and Windows Server 2008 R2 (which hopefully is no longer in use as support has ended), install Windows Management Framework (WMF) 4.0 or higher.
> An overview of WMF can be found here: [WMF overview](https://docs.microsoft.com/de-de/powershell/wmf/overview)

### Installation via MSI package
The following installation works for client systems running Windows 7 SP1 and Windows Server 2008 R2 SP1 or later.
 
You can download the latest PowerShell MSI package from [**GitHub here**](https://github.com/PowerShell/PowerShell/releases). Once you have accessed the page, select the “Assets” section and download the MSI package. The MSI file can be identified by the following name:
```powershell
PowerShell-<version>-win-<os-arch>.msi 
```
After downloading, you can start the installation of this package by double-clicking on it.
 
You can then start PowerShell as described above.

### Installing Windows PowerShell via the command line
Of course, you can also perform the installation via the command line. This allows you to perform the installation without user interaction. The command line you need to use for an installation with all options enabled is as follows:
 
```powershell
msiexec.exe /package PowerShell-<version>-win-<os-arch>.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 
```
A complete list of command line options for “Msiexec.exe” can be found at [**Command line options**](https://docs.microsoft.com/de-de/windows/desktop/Msi/command-line-options).
## Installing Windows PowerShell Core on Linux
As mentioned at the beginning, PowerShell C## Video tutorial on PowerShell on Udemy
I highly recommend Tom Wechsler's course on the Udemy platform. This is not meant to be an advertisement for affiliate links, but his courses are really great.
  
  
In this example, I will show you how to install the core version on the following three Linux systems:
**Ubuntu 18.04 or newer, Debian 10 or newer, and Kali Linux**
Info:
Many other distributions are also supported, but listing every /posts/windows/cmd-commands-at-a-glance/single installation instruction here would be too much.
Help for other platforms can be found here on [this Microsoft page.](https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6)
 
### Installing Windows PowerShell – Installation on Ubuntu 18.04 or higher
The PowerShell Core application is installed via package repositories, which is also the preferred method. To do this, open a terminal instance as SuperUser and then run the installation as follows:
Start by downloading and installing the Microsoft GPG keys
```shell
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
```
Now the actual installation follows...
```shell
# Update the list of products
sudo apt-get update
# Activate the “universe” repositories
sudo add-apt-repository universe
# Install PowerShell
sudo apt-get install -y powershell
```
After installing the package, please run “pwsh” via the terminal.
### Uninstalling on Ubuntu 18.04 or higher
To uninstall PowerShell Core on Ubuntu 18.04, enter the following command in the terminal window:
```shell
sudo apt-get remove powershell
```
### Installation on Debian 10 or higher
Just like on Ubuntu, open a terminal instance as superuser and perform the installation by entering the following commands:
```shell
# Install system components
sudo apt-get update
sudo apt-get install -y curl gnupg apt-transport-https
# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list'
# Update the list of products
sudo apt-get update
# Install PowerShell
sudo apt-get install -y powershell
# Start PowerShell
pwsh
```
Once the installation is complete, run PowerShell by entering the command “pwsh”.
### Uninstalling on Debian 10 or higher
To uninstall PowerShell Core on Debian 9, enter the following command in the terminal window:
```shell
sudo apt-get remove powershell
```
### Installation on Kali Linux
Last but not least, installation on Kali Linux.
Start a terminal instance as SuperUser again and enter the following commands:
```shell
# Download & install prerequisites
wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu57_57.1-6+deb9u2_amd64.deb
dpkg -i libicu57_57.1-6+deb9u2_amd64.deb
apt-get update && apt-get install -y curl gnupg apt-transport-https
# Add Microsoft Public Repository Key to APT
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
# Add Microsoft Package Repository to the source list
echo “deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main” | tee /etc/apt/sources.list.d/powershell.list
# Install PowerShell package
apt-get update && apt-get install -y powershell
# Start PowerShell
pwsh
```
### Uninstalling under Kali
To uninstall PowerShell Core under Kali Linux, enter the following command in the terminal window:
```shell
# Uninstall PowerShell package
apt-get remove -y powershell
```
## Installing Windows PowerShell – Installing PowerShell Core under macOS
The Core version can also be installed on macOS, but this requires a little preparation and is only possible with macOS version 10.12 or higher.
### Preparing to install the Core version on macOS
To install on macOS, you must first install the Homebrew package manager on your system if it is not already installed. To find out whether the package manager is on your system, you can simply enter the command “brew” in your terminal window. If this command is not found, you must first install this package manager. 
#### Install the Homebrew package manager (optional, if not already installed)
Installing Homebrew is quite simple. Just enter the following command in your terminal window and follow the instructions.
For more information, visit the [Homebrew website**](https://brew.sh/index_de).
```shell
/usr/bin/ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”
```
### Now you can start the installation on macOS
After successfully installing Homebrew on your Mac, we can now begin installing Windows PowerShell Core. To do this, enter the following commands in your terminal window:
```shell
brew cask install powershell
```
Once the installation is complete, you should test that it is working. To do this, start the Windows PowerShell Core installation by entering the command “pwsh”.
If you want to upgrade to a newer version, you can do so by entering the following command:
```shell
brew update
brew cask upgrade powershell
```
### Install dependencies for the PowerShell installation
Finally, all dependencies required for the PowerShell installation must be updated.
#### XCode command line tools
First, we start by installing the XCode command line tools on your system.
```shell
xcode-select --install
```
#### Install OpenSSL
Next, install OpenSSL. We'll do this again using Brew
```shell
brew install openssl
```
This completes the installation on macOS and ensures that all dependencies are installed.
If you want to uninstall PowerShell Core, proceed as follows.
### Uninstalling PowerShell Core on macOS
To uninstall, enter the following command in Brew:
```shell
brew cask uninstall powershell
```
PowerShell Core is now removed from your system. You can then uninstall the paths using the command “sudo rm”.
The paths can be found here:
- `$PSHOME` is `/usr/local/microsoft/powershell/6.2.0/`.
- User profiles are read via `~/.config/powershell/profile.ps1`.
- Default profiles are read via `$PSHOME/profile.ps1`.
- User modules are read via `~/.local/share/powershell/Modules`.
- Shared modules are read via `/usr/local/share/powershell/Modules`.
- Standard modules are read via `$PSHOME/Modules`.
- The history of “PSReadline” is recorded in `~/.local/share/powershell/PSReadLine/ConsoleHost_history.txt`.
## Summary
I hope this article will be helpful for your project!
I will, of course, explore this topic in more depth in future articles, where I will discuss the operation, functions, and available commands in more detail. We will also take a look at the script editor and how it works.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://help.secure-bits.org)
<!-- FM:Snippet:End -->