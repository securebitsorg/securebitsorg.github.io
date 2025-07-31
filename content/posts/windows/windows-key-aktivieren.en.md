---
title: Activate Windows Product Key
description: Learn how to easily activate your Windows Product Key and increase your productivity with these simple steps.
date: 2017-01-22
preview: ../../../assets/images/posts/windows/Windows Product Key.jpg
draft: false
tags:
- cmd 
- powershell
- windows
- tutorials
categories:
- Tutorials
- “Windows”
hero: /images/posts/windows/Windows Product Key.jpg
menu:
  sidebar:
    name: Activate Windows Product Key
    identifier: windows-key
    parent: windows
keywords:
- windows product key
slug: windows-product-key-activate
---
> ### Other Windows versions
>
> Of course, you can also use this method to change or activate the product key for any other Windows version.
To activate it, you will need to use your product key instead! The product keys shown in this article are only suitable for use with Windows Insider Preview!
## Activate Windows Product Key
When performing an in-place upgrade of Windows 10 Enterprise, you may be prompted to reactivate Windows after the upgrade. When you try to reactivate, the process ends with an error code.  [text](windows-key-aktivieren.de.md)
The following instructions will show you how to change the product key and then activate your Windows 10 Insider Preview or any other version of Windows.
## Read out the Windows product key
You can easily read out the product key via the command line (CMD). To do this, start the command line or PowerShell with administrator rights as described below in this article and then enter the following command.
```msdos
wmic path softwarelicensingservice get OA3xOriginalProductKey
```
In the command line window, you can then view the stored 25-digit product key under the output “OA3xOriginalProductKey”.

## Change Windows product key
To change the product key, start the command line tool (CMD) with administrator rights. You can do this by entering the command “CMD” in the search field, opening the context menu with the right mouse button, and selecting “Run as administrator.”

![cmd_aufrufen](/images/posts/windows/cmd_aufrufen.jpg)

After opening the command line, enter the following command and the product key:
### Product Key Enterprise Version
```msdos
Slmgr.vbs /ipk PBHCJ-Q2NYD-2PX34-T2TD6-233PK (Enterprise version)
Slmgr.vbs /ipk “Your product key” (from your Windows version)
```

### Product Key Pro version
```msdos
Slmgr.vbs /ipk NKJFK-GPHP7-G8C3J-P6JXR-HQRJR (Pro version)
Slmgr.vbs /ipk “Your product key” (from your Windows version)
```
---
![change Windows product key](/images/posts/windows/Befehl_Key_aendern.jpg)
---
Windows should now have updated the product key to the one you entered.
## Activate Windows product key
After changing the product key, it must be activated. You can do this by entering the following command in the CMD input window:
```msdos
slmgr.vbs /ato
```
---
![Activate Windows product key](/images/posts/windows/Befehl_Aktivierung.jpg)
---
After entering the above command, Windows will be activated after a short time and you can now exit the command console by entering the command ‘Exit’.

<!-- FM:Snippet:Start data:{"id":"Visit Help-page","fields":[]} -->
> ## Questions and answers
> 
> If you have any questions or feedback about this blog or YouTube channel, please use my help page. Here you will find questions and answers about the various posts. You are also welcome to ask your own question here.
>
> [**Visit the Help-page**](https://ticket.secure-bits.org/help)
<!-- FM:Snippet:End -->