# PC Diagnostic

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[PC OS Restore](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-OS-Restore.md#pc-os-restore) | 
[PC Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#pc-diagnostic) | 
[PC Maintenance](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Maintenance.md#pc-maintenance) | 
[PC Virus Removal](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Virus-Removal.md#pc-virus-removal)

[Initial](#initial) <br>
[Hardware](#hardware) <br>
[Scan](#scan) <br>
[Windows](#windows) <br>
[Additional](#additional) <br>
[Cleanup](#cleanup)<br>
[Customer Note](#customer-note) <br>

#### Initial
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
PC-Check standard hardware test result: Pass/Fail
--- Hardware Test Completed ---
```

#### Scan
> - [ ] AdwCleaner scan
> - [ ] Malwarebytes scan

```
+++ Security Scan Started +++
AdwCleaner - Security threats detected: #
Malwarebytes - Security threats detected: #
--- Security Scan Completed ---
```

#### Windows
> - [ ] Check disk
> - [ ] System file check
> - [ ] Device drivers
> - [ ] System configuration (msconfig)
> - [ ] Reliability history
> - [ ] Event Viewer

```
+++ System Diagnostic Started +++
Current Windows feature update: #
File system test result: Pass/Fail
Windows integrity test result: Pass/Fail
Device manager check: Pass/Fail
System configuration check: Pass/Fail
Reliability History / Event Viewer:
- No recurring issues
--- System Diagnostic Completed ---
```

#### Additional
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

#### Cleanup
> - [ ] Remove our tools
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
• Standard hardware test: Pass/Fail
• Adware threats Found: #
• Malware threats Found: #
• Current windows feature update: #
• File system test: Pass/Fail
• Windows integrity test: Pass/Fail
• Device driver check: Pass/Fail
• System configuration check: Pass/Fail
• Reliability History / Event Viewer:
--- No recurring issues.
• System benchmark: Low/Average/High performance
• Storage drive benchmark: Low/Average/High performance
• <Security> is active and has # days remaining in its license.
```
