# PC Diagnostic

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#pc-diagnostic) | 
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
> - [ ] Is backup required

```
--- Initial---
Unit serial matches ticket: Yes/No
Data Backup Started / Sauvegarde des données commencée
Data Backup Completed / Sauvegarde des données terminée
```

#### Hardware
> - [ ] S.M.A.R.T check
> - [ ] Hardware diagnostic

```
--- Hardware ---
Hard Drive Test Result: Pass/Fail / Résultat du test du disque dur : réussite/échec
Hardware Tests Started / Tests du matériel commencés
Hardware Tests Completed / Tests du matériel terminés
Hardware Test Result: Pass/Fail / Résultat des tests du matériel : réussite/échec
```

#### Scan
> - [ ] Malwarebytes scan
> - [ ] AdwCleaner scan

```
--- Scan ---
Security Scan Started / Balayage de sécurité commencé
AdwCleaner: Security Threats Detected: # / Menaces de sécurité détectées : #
Malwarebytes: Security Threats Detected: # / Menaces de sécurité détectées : #
Security Scan Completed / Balayage de sécurité terminé
```

#### Windows
> - [ ] Check disk
> - [ ] System file check
> - [ ] Device drivers
> - [ ] System configuration (msconfig)
> - [ ] Reliability history
> - [ ] Event Viewer

```
--- Windows ---
Windows Diagnostic Started / Diagnostic de Windows commencé
Disk Error Test Result: Pass/Fail
Windows System File Test Result: Pass/Fail
Device Driver Test: Pass/Fail
System Configuration Test: Pass/Fail
Reliability History Test: Pass/Fail
Event Viewer Test: Pass/Fail
Windows Diagnostic Completed / Diagnostic de Windows terminé
```

#### Additional
> - [ ] Test concerns from customer
> - [ ] Check security suite

```
--- Additional ---
<Security Suite> is active, updated and expires in # days
```

#### Cleanup
> - [ ] Remove our tools
> - [ ] Reset power settings
> - [ ] Write service summary and recommendations\

```
--- Cleanup ---
Power settings reset to default
```

### Customer Note
```
Service Summary:
• Hardware Test: Pass/Fail
• Malware Test: #
• System File Test: Pass/Fail
• System Partition Test: Pass/Fail
• Device Driver Test: Pass/Fail
• Startup Files: Pass/Fail
• Reliability History / Event Viewer: 
--- Event
--- Event
• <Security> is active and up to date, expires in #

Recommendation:
1. <type custom recommendation>
```
