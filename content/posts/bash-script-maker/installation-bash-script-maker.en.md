---
title: Installation Bash-Script-Maker
description: Find out here how you can easily install the Bash Script Maker app on your system.
date: 2025-09-05T06:36:30.762Z
draft: false
tags:
    - bash
    - bash-script-maker
    - linux
categories:
    - Scripting
    - Bash-Script-Maker
    - Linux
menu:
    sidebar:
        name: Installation of Bash Script Maker
        weight: 200
        identifier: install-Maker
        parent: maker
keywords:
    - installation bash-script-maker
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
hero: /images/bash-maker/Bash-Script-Maker.webp
---
## Installing Bash Script Maker on Linux
There are several ways to install **Bash Script Maker** on Linux.

### Installation options on Linux
### Requirements
- Python 3.8 or higher
- Git (for the recommended method)
- Tkinter (GUI library)
- Zenity (for dialog functions)
- Linux distribution with apt, dnf, pacman, or similar package manager

### Automatic installation

**Recommended method (automatic operating system detection):**

```bash
git clone https://github.com/securebitsorg/bash-script-maker.git
cd bash-script-maker
./install.sh
```

**Specific to distributions:**

For Ubuntu/Debian-based systems:
```bash
./install_apt.sh
```

For Fedora/RHEL/CentOS-based systems:
```bash
./install_dnf.sh
```

### Manual installation

If the automatic scripts do not work, please install the packages manually:

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install python3 python3-tk python3-pip zenity xterm
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install python3 python3-tkinter python3-pip zenity xterm
```

**Arch Linux:**
```bash
sudo pacman -S python python-tk python-pip zenity xterm
```
<!-- FM:Snippet:Start data:{“id”:“Vertical Space”,“fields”:[]} -->
{{< vs 2>}}
<!-- FM:Snippet:End -->

> **Other distributions:**
> 
> See `packages.txt` in the repository for detailed package lists.

### Python dependencies
```bash
pip install -r requirements.txt
```
### Checking the installation

After installation, you can test whether everything is working correctly:
```bash
./test_installation.sh
./tools/test_dependencies.py
```

These scripts check all dependencies and provide detailed information about any problems.

### Available scripts

The project includes the following installation and help scripts:

- `install.sh` - **Universal installation script** (recommended)
- `install_apt.sh` - Specific for Ubuntu/Debian
- `install_dnf.sh` - Specific for Fedora/RHEL/CentOS
- `test_installation.sh` - Checks the installation
- `tools/test_dependencies.py` - Detailed dependency tests
- `tests/test_basic.py` - Pytest tests for basic functionality
- `start.sh` - Starts the program with dependency check

All scripts are executable and can be called directly.

## Starting Bash Script Maker
**Starting Bash Script Maker**

To start **Bash Script Maker**, change to the directory where Bash Script Maker was installed.
Then you can start the program with the following command:

```sh
# Start Bash Script Maker

python bash_script_maker.py
```

<!-- FM:Snippet:Start data:{“id”:“Vertical Space”,“fields”:[]} -->
{{< vs 3>}}
<!-- FM:Snippet:End -->
**Have fun scripting!**
