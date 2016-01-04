# Windows Connectivity Check

This is a simple PowerShell script to test connectivity between your server and TokenEx.

## Usage


To test connectivity to api.tokenex.com add the -API switch

```powershell

.\TokenExConnectivityTest.ps1 -API
```
The result should look like this: 
```
=============Checking api.tokenex.com=========
Checking DNS...
DNS OK! api.tokenex.com Resolved to 146.88.98.
Checking Port...
Port Check OK! TCP/443 is open to api.tokenex.
Checking HTTPS...
HTTPS OK! GET made to https://api.tokenex.com
=============All Checks Complete=============
```

To test connectivity to batch.tokenex.com add the -Batch switch

```powershell

.\TokenExConnectivityTest.ps1 -API
```
 The result should look like this: 
```
=============Checking batch.tokenex.com=======
Checking DNS...
DNS OK! batch.tokenex.com Resolved to 146.88.1
Checking Port...
Port Check OK! TCP/22 is open to batch.tokenex
=============All Checks Complete=============
```

To test connectivity to batch.tokenex.com and api.tokenex.com add the -Batch and -API switch

```powershell
.\TokenExConnectivityTest.ps1 -API -Batch
```

You can also test connectivity to the Test Environment with the -Test switch


```powershell
.\TokenExConnectivityTest.ps1 -API -Test
```
