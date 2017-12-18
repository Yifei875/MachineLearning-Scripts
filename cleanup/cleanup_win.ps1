# cleanup_win.ps1
# Copyright (c) Microsoft. All rights reserved.

# Kill all dotnet processes
if ((Get-Process | Where-Object ProcessName -eq 'dotnet').count -gt 0) 
{
	Stop-Process -Name dotnet
 	# sleep for 5 secons and wait till all processes are killed
	Start-Sleep 5
}

# Kill all Python processes
if ((Get-Process | Where-Object ProcessName -eq 'Python').count -gt 0) 
{
	Stop-Process -Name Python
 	# sleep for 5 secons and wait till all processes are killed
	Start-Sleep 5
}

# Close AML Workbench 
if ((Get-Process | Where-Object ProcessName -eq 'AmlWorkbench').count -gt 0) 
{
	Stop-Process -Name AmlWorkbench
 	# sleep for 5 secons and wait till all processes are killed
	Start-Sleep 5
}

$desktop = [System.IO.Path]::Combine($env:HOMEPATH, "Desktop")
$desktopv = [System.IO.Path]::Combine($desktop, "Azure Machine Learning Workbench.lnk")
if (Test-Path -Path $desktopv)
{
   Write-Host $desktopv "exists, deleting"
   Remove-Item $desktopv -Force -Recurse
   Write-Host "done"
}

$local = $env:LOCALAPPDATA
$localv = [System.IO.Path]::Combine($local, "amlworkbench")
if(Test-Path -Path $localv)
{
    Write-Host $localv "exists, deleting..."
    Remove-Item $localv -Force -Recurse
    Write-Host "done"
}

# New installer
$localv = [System.IO.Path]::Combine($local, "amlinstaller")
if(Test-Path -Path $localv)
{
    Write-Host $localv "exists, deleting..."
    Remove-Item $localv -Force -Recurse
    Write-Host "done"
}

$remote = $env:APPDATA
$remotev = [System.IO.Path]::Combine($remote, "AmlWorkbench")
if(Test-Path -Path $remotev)
{
    Write-Host $remotev "exists, deleting..."
    Remove-Item $remotev -Force -Recurse
    Write-Host "done"
}
