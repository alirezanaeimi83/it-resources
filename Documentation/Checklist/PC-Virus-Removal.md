# PC Virus Removal

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[PC OS Restore](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-OS-Restore.md#pc-os-restore) | 
[PC Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#pc-diagnostic) | 
[PC Maintenance](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Maintenance.md#pc-maintenance) | 
[PC Virus Removal](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Virus-Removal.md#pc-virus-removal)

[Initial](#initial) <br>
[Hardware](#hardware) <br>
[Remediation](#remediation) <br>
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

### Remediation
> - [ ] Adwcleaner clean
> - [ ] Malwarebytes clean
> - [ ] Verification scan

```
+++ Security Remediation Started +++
AdwCleaner - Security threats removed: #
Malwarebytes - Security threats removed: #
Verification - Security threats remaining: #
--- Security Remediation Completed ---
```

### Windows
> - [ ] Repair operating system
> - [ ] Repair drive file system

```
+++ System Repair Started +++
File system repair result: Pass/Fail
Windows integrity repair result: Pass/Fail
--- System Repair Completed ---
```

### Optimization
> - [ ] Remove PUPs
> - [ ] CCleaner on file and registry

```
+++ Optimization Started +++
Potentially unwanted programs removed:
- No malicious items
Device optimization started
Device optimization completed
--- Optimization Completed ---
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
<Security Suite> is active, updated and expires in # days
System benchmark: Low/Average/High performance
Storage drive benchmark: Low/Average/High performance
--- Customization Completed ---
```

### Cleanup
> - [ ] Remove tools
> - [ ] Reset power settings
> - [ ] Create restore point
> - [ ] Write service summary and recommendation

```
+++ Cleanup Started +++
Removed remote tools
Power settings reset to default
Restore point created: 'Staples Service Complete'
--- Cleanup Completed ---
```
### Customer Note
```
Service Summary:
-------------------------


Service Breakdown:
-------------------------
• Adware threats removed: #
• Malware threats removed: #
• Disk file system checked and errors were repaired.
• Windows integrity checked and corruption was repaired.
• Removed potentially unwanted programs from device that can cause instability, slowdowns, and deliver advertisements.*
• Optimized registry and removed unnecessary junk files to speed up boot time.
• Windows updated to the latest version available for this unit.
• Drivers updated to the latest version provided by manufacturer:
---
• System Benchmark: Low/Average/High performance
• Storage drive benchmark: Low/Average/High performance
• <Security Suite> is active and up to date, with # days remaining on its license.
• Created restore point 'Virus Removal Complete'. The computer can be restored to this point if something goes wrong in the future.

*Potentially Unwanted Programs Removed:
- <list programs>
```
