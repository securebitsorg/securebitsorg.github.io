---
title: Using Bash Script Maker
description: Using and function of the Bash Script Maker app
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
tags:
    - bash
    - bash-script-maker
    - linux
  
categories:
    - Bash-Script-Maker
    - Linux
    - Scripting
hero: /images/bash-maker/Bash-Script-Maker.webp
menu:
    sidebar:
        name: Using the Bash Script Maker app
        weight: 300
        identifier: using-maker
        parent: maker
keywords:
    - Using Bash-Script-Maker
---
## Usage

### Start the program
```bash
# Start Bash Script Maker

python bash_script_maker.py
```

### Create a script
1. Select the desired command modules from the left palette
2. Click on a module to insert it into the editor
3. Edit the parameters as needed
4. Save the script
5. Test the created script with the Run function

### Edit existing script
1. Click on the ‘Open’ button
2. Select the shell script file in the dialog window
3. Confirm by clicking on ‘Open’
4. The opened shell script is displayed in the script editor

### Keyboard shortcuts
- `Ctrl+N`: New script
- `Ctrl+O`: Open script
- `Ctrl+S`: Save script
- `Ctrl+Shift+S`: Save script as
- `Ctrl+Q`: Exit program
- `F5`: Run script
- `Ctrl+Z`: Undo
- `Ctrl+Y`: Redo

### Editor keyboard shortcuts
- `Tab`: Indent (current line or selection)
- `Shift+Tab`: Outdent (current line or selection)
- `Ctrl+A`: Select all
- `Ctrl+D`: Duplicate line
- `Ctrl+/`: Toggle comment
- `Ctrl+Space`: Show autocomplete
- `Ctrl+Tab`: Alternative for autocomplete
- `Enter`: Automatic indentation in new lines
- `Backspace`: Smart unindentation at tab stops
- `Escape`: Close suggestion list

### Automatic formatting
The editor automatically recognizes Bash structures and adjusts the indentation:
- Indents after `if`, `then`, `else`, `for`, `while`, `case`, `function`
- Unindents after `fi`, `done`, `esac`
- Indents with 4 spaces (Bash standard)

### Auto-completion
Smart auto-completion offers context-sensitive suggestions:

#### Supported suggestion types
- **Bash commands**: ls, cp, mv, grep, sed, awk, find, etc.
- **Bash keywords**: if, then, else, fi, for, while, function, etc.
- **Variables**: $HOME, $PATH, $PWD, $USER, user-defined variables
- **File and path completion**: Automatic completion of paths
- **Command options**: Frequently used options for well-known commands

#### Navigating suggestions
- `↑/↓`: Navigate between suggestions
- `Enter/Tab`: Accept suggestion
- `Escape`: Close suggestion list
- `Mouse wheel`: Scroll through list

#### Context-sensitive suggestions
- **At the beginning of a line**: All available commands and keywords
- **At $**: Variable suggestions
- **At paths**: File and directory completion
- **After known commands**: Relevant options

## Feedback
---
### Suggestion for a new/missing feature?!
If you think a feature is missing, you can suggest your requests as a [**feature request on GitHub**](https://github.com/securebitsorg/Bash-Script-Maker/issues).

### Found a bug?!
If you have found a bug, you can also post it on [**GitHub**](https://github.com/securebitsorg/Bash-Script-Maker/issues).

### Found a security issue?!
<!-- FM:Snippet:Start data:{“id”:‘Danger’,“fields”:[]} -->
{{< alert type="danger" >}}

If you have any information about bugs that affect the security of the app, you can [--> send me the information here on GitHub.](https://github.com/securebitsorg/Bash-Script-Maker/security/advisories)
{{< /alert >}}

<!-- FM:Snippet:End -->
