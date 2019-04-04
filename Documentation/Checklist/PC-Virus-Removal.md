# Virus Removal

[PC Setup](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Setup.md#pc-setup) | 
[Diagnostic](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Diagnostic.md#pc-diagnostic) | 
[Maintenance](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Maintenance.md#maintenance) | 
[Virus Removal](https://github.com/justinchapdelaine/IT-Resources/blob/master/Documentation/Checklist/PC-Virus-Removal.md#virus-removal) 

[Initial](#initial) <br>
[Hardware](#hardware) <br>
[Remediation](#remediation) <br>
[Optimization](#optimization) <br>
[Updates](#updates) <br>
[Additional](#additional) <br>
[Cleanup](#cleanup)<br>
[Customer Note](#customer-note) <br>

### Initial
> - [ ] Disable monitor and sleep timeout
> - [ ] Verify serial number
> - [ ] Is backup required

```
Unit serial matches ticket: Yes/No
Data Backup Started / Sauvegarde des données commencée
Data Backup Completed / Sauvegarde des données terminée
```

### Hardware
> - [ ] S.M.A.R.T check

```
Hard Drive Test Result: Pass/Fail / Résultat du test du disque dur : réussite/échec
```

### Remediation
> - [ ] Run rKill
> - [ ] Adwcleaner clean
> - [ ] Malwarebytes clean
> - [ ] Verification scan

```
Security Remediation Started / Nettoyage de sécurité commencé
rKill - Security Threats Removed: insert number / Menaces de sécurité supprimées : insérer le nombre
AdwCleaner - Security Threats Removed: insert number / Menaces de sécurité supprimées : insérer le nombre
Malwarebytes - Security Threats Removed: insert number / Menaces de sécurité supprimées : insérer le nombre
Verification - Security Threats Removed: insert number / Menaces de sécurité supprimées : insérer le nombre
Security Remediation Completed / Nettoyage de sécurité terminé
```

### Optimization
> - [ ] Remove PUPs
> - [ ] CCleaner on file and registry

```
Programs Removed: <list items>
Device Optimization Started / Optimisation de l’appareil commencée
Device Optimization Completed / Optimisation de l’appareil terminée
```

### Updates
> - [ ] System updates
> - [ ] Driver updates

```
System Updates Started / Mises à jour du système commencées
System Updates Completed / Mises à jour du système terminées
Driver updates started
Driver updates completed
```

### Additional
> - [ ] Repair system files
> - [ ] Test concerns from customer
> - [ ] Check security suite

```
System file repair started
System file repair completed
<Security Suite> is active, updated and expires in <###> days
```

### Cleanup
> - [ ] Remove tools
> - [ ] Reset power settings
> - [ ] Create restore point
> - [ ] Write service summary and recommendation

```
Power settings reset to default
Restore point created: 'Virus Removal Completed'
```
### Customer Note:
```
Service Summary:
-------------------------
Service Summary:
• Malware threats removed: 18
• Adware threats removed: 62
• System files checked and corruption was repaired.
• Removed potentially unwanted programs from device that can cause instability, slowdowns, and deliver advertisement.*
• Optimized registry and removed unnecessary junk files to speed up boot time.
• Windows updated to latest version avaliable for this unit (Version 1809).
• Drivers updated to latest version provided by manufacture:
--- BIOS, Graphics, Network, Audio.
• McAfee is active and up to date, expires in 279 days
• Created restore point 'Virus Removal Complete'. The computer can be restored to this point if something goes wrong in the future.

*Potentially Unwanted Programs Removed:
- Driver Easy
- SlimCleaner Plus
- WinZip (trial expired)
```
