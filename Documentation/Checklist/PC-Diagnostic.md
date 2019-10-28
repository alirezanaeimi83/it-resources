# Diagnostic

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#diagnostic) | 
[Maintenance](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Maintenance.md#maintenance) | 
[Virus Removal](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Virus-Removal.md#virus-removal) 

[Initial](#initial) <br>
[Hardware](#hardware) <br>
[Scan](#scan) <br>
[Windows](#windows) <br>
[Additional](#additional) <br>
[Cleanup](#cleanup)<br>
[Customer Note](#customer-note) <br>

#### Initial
> - [ ] Disable monitor and sleep timeout
> - [ ] Verify serial number 
> - [ ] S.M.A.R.T check

```
--- Initialization Started ---
Unit serial matches ticket: Yes/No
Disabled monitor and sleep timeout
Windows S.M.A.R.T test: Pass/Fail 
--- Initialization Completed ---
```

#### Hardware
> - [ ] Hard Drive test
> - [ ] Hardware diagnostic

```
--- Hardware Test Started ---
CrystalDisk hard drive test result: Pass/Fail
PC-Check Hardware test result: Pass/Fail
--- Hardware Test Completed ---
```

#### Scan
> - [ ] AdwCleaner scan
> - [ ] Malwarebytes scan

```
--- Security Scan Started ---
AdwCleaner: Security threats detected: #
Malwarebytes: Security threats detected: #
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
--- System Diagnostic Started ---
Disk file system test result: Pass/Fail
Windows integrity test result: Pass/Fail
Device manager check: Pass/Fail
System configuration check: Pass/Fail
Reliability History / Event Viewer:
- No recurring issues
--- System Diagnostic Completed ---
```

#### Additional
> - [ ] Test concerns from customer
> - [ ] Check security suite
> - [ ] Perform a system benchmark

```
--- Customization Started ---
<Security Suite> is active, updated and expires in # days
System Benchmark: Low/Average/High performance
--- Customization Completed ---
```

#### Cleanup
> - [ ] Remove our tools
> - [ ] Reset power settings
> - [ ] Write service summary and recommendations

```
--- Cleanup Started ---
Power settings reset to default
Removed remote tools
--- Cleanup Completed ---
```

### Customer Note
```
Service Summary:
-------------------------
<Summary of service>

Recommendation:
-------------------------
1) <type custom recommendation>

Service Breakdown:
-------------------------
• Hardware Test: Pass/Fail
• Malware Threats Found: #
• Adware Threats Found: #
• Disk File System Test: Pass/Fail
• Windows Integrity Test: Pass/Fail
• Device Driver Check: Pass/Fail
• System Configuration Check: Pass/Fail
• Reliability History / Event Viewer: 
--- No recurring issues.
• System Benchmark: Low/Average/High performance
• <Security> is active and up to date, expires in #
```
