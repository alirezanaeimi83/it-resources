# Maintenance

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#pc-diagnostic) | 
[Maintenance](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Maintenance.md#maintenance) | 
[Virus Removal](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Virus-Removal.md#virus-removal) 

[Initial](#initial) <br>
[Scan](#scan) <br>
[Windows](#windows) <br>
[Optimization](#optimization) <br>
[Updates](#updates) <br>
[Additional](#additional) <br>
[Cleanup](#cleanup)<br>
[Customer Note](#customer-note) <br>

### Initial
> - [ ] Disable monitor and sleep timeout
> - [ ] Verify serial number 
> - [ ] S.M.A.R.T check

```
--- Initialization Started ---
Unit serial matches ticket: Yes/No
Disabled monitor and sleep timeout
Hard Drive S.M.A.R.T test: Pass/Fail 
--- Initialization Completed ---
```

### Scan
> - [ ] Malwarebytes scan
> - [ ] AdwCleaner clean

```
--- Security Scan Started ---
AdwCleaner: Security threats detected: #
Malwarebytes: Security threats removed: #
--- Security Scan Completed ---
```

### Windows
> - [ ] Repair operating system
> - [ ] Repair drive file system

```
--- System Repair Started ---
Disk file system repair started
Windows integrity repair started
Disk file system repair result: Pass/Fail
Windows integrity repair result: Pass/Fail
--- System Repair Completed ---
```

### Optimization
> - [ ] Remove PUPs
> - [ ] CCleaner on file and registry

```
--- Optimization Started ---
Potentially unwanted programs removal started
Potentially unwanted programs removal completed
Device optimization started
Device optimization completed
--- Optimization Completed
```

### Updates
> - [ ] System updates
> - [ ] Driver updates

```
--- Updates Started ---
System updates started
System updates completed
Driver updates started
Driver updates completed
--- Updates Completed ---
```

### Additional
> - [ ] Test concerns from customer
> - [ ] Check security suite

```
--- Customization Started ---
<Security Suite> is active, updated and expires in # days
--- Customization Completed ---
```

### Cleanup
> - [ ] Remove tools
> - [ ] Reset power settings
> - [ ] Write service summary and recommendations

```
--- Cleanup Started ---
Power settings reset to default
Removed remote tools
--- Cleanup Completed
```

### Customer Note
```
Service Summary:
-------------------------
• Malware threats detected: #
• Adware threats removed: #
• Disk file system checked and errors were repaired.
• Windows integrity checked and corruption was repaired.
• Removed potentially unwanted programs from device that can cause instability, slowdowns, and deliver advertisement.*
• Optimized registry and removed unnecessary junk files to speed up boot time.
• Windows updated to latest version avaliable for this unit (Version 1809).
• Drivers updated to latest version provided by manufacture:
--- BIOS, Graphics, Network, Audio.
• <Security> is active and up to date, expires in #

*Potentially Unwanted Programs Removed:
- <list programs>

Recommendation:
-------------------------
1. <type custom recommendation>
```
