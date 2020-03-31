# PC Maintenance

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[PC OS Restore](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-OS-Restore.md#pc-os-restore) | 
[PC Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#pc-diagnostic) | 
[PC Maintenance](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Maintenance.md#pc-maintenance) | 
[PC Virus Removal](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Virus-Removal.md#pc-virus-removal)

[Initial](#initial) <br>
[Hardware](#hardware) <br>
[Scan](#scan) <br>
[Windows](#windows) <br>
[Optimization](#optimization) <br>
[Updates](#updates) <br>
[Additional](#additional) <br>
[Cleanup](#cleanup)<br>
[Customer Note](#customer-note) <br>

### Initial
> - [ ] Verify serial number 
> - [ ] Disable monitor and sleep timeout
> - [ ] S.M.A.R.T check

```
+++ Initialization Started +++
Unit serial matches ticket: Yes/No
Disabled monitor and sleep timeout
Windows S.M.A.R.T test: Pass/Fail 
--- Initialization Completed ---
```

#### Hardware
> - [ ] Storage drive test
> - [ ] Hardware test

```
+++ Hardware Test Started +++
CrystalDisk hard drive test result: Pass/Fail
PC-Check basic hardware test result: Pass/Fail
--- Hardware Test Completed ---
```

### Scan
> - [ ] Malwarebytes scan
> - [ ] AdwCleaner clean

```
+++ Security Scan Started +++
AdwCleaner - Security threats removed: #
Malwarebytes - Security threats detected: #
--- Security Scan Completed ---
```

### Windows
> - [ ] Repair drive file system
> - [ ] Repair operating system

```
+++ System Repair Started +++
File system repair result: Pass/Fail
Windows integrity repair result: Pass/Fail
--- System Repair Completed ---
```

### Optimization
> - [ ] Remove potentially unwated programs (PUPs / PUAs)
> - [ ] CCleaner on junk and registry

```
+++ Optimization Started +++
Potentially unwanted programs removed:
- No malicious items.
Device optimization started
Device optimization completed
--- Optimization Completed
```

### Updates
> - [ ] System updates
> - [ ] Driver updates

```
+++ Updates Started +++
System updates started
System updates completed
Driver updates started
Driver updates completed
--- Updates Completed ---
```

### Additional
> - [ ] Check security suite
> - [ ] Perform a system benchmark
> - [ ] Perform a drive benchmark
> - [ ] Test concerns from customer

```
+++ Customization Started +++
<Security Suite> is active and up to date, with # days remaining on its license.
System benchmark: Low/Average/High performance
Storage drive benchmark: Low/Average/High performance
--- Customization Completed ---
```

### Cleanup
> - [ ] Remove tools
> - [ ] Reset power settings
> - [ ] Write service summary and recommendations

```
+++ Cleanup Started +++
Power settings reset to default
Removed remote tools
--- Cleanup Completed ---
```

### Customer Note
```
Service Summary:
-------------------------
<summary of service>

Recommendation:
-------------------------
1) <custom recommendation>

Service Breakdown:
-------------------------
• Basic hardware test: Pass/Fail
• Adware threats removed: #
• Malware threats detected: #
• File system checked and errors were repaired.
• Windows integrity checked and corruption was repaired.
• Removed potentially unwanted programs that can cause instability, slowdowns, and deliver advertisements.*
• Optimized registry and removed unnecessary junk files to speed up boot time.
• Windows updated to latest version avaliable for this unit.
• Drivers updated to latest version provided by manufacturer:
--- 
• System benchmark: Low/Average/High performance
• Storage drive benchmark: Low/Average/High performance
• <Security Suite> is active and up to date, with # days remaining on its license.

*Potentially Unwanted Programs Removed:
- <list programs>
```
