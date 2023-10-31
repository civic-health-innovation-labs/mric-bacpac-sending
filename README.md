# Script for sending bacpac files into the blob storage
Author: David Salac

## Introduction
Simple PowerShell scripts that send the latest bacpac file to the Azure Storage Account's blob. It simply lists all files with the extension `.bacpac` in the given folder, selects the last one (when alphabetically sorted) and transfers it using the `azcopy` tool. It requires a SAS token.

## Prerequisites
You need to have:
 - Install **AzCopy** [see the Microsoft AzCopy website here](https://learn.microsoft.com/en-us/azure/storage/common/storage-ref-azcopy).
 - **Path** to the landing folder for `bacpac` files.
 - **Blob SAS URL** with permissions Write, Add, Immutable storage (can be generated through Azure Portal).

## Installation guide
1. Copy the PowerShell script (located: `src/bacpac_upload.ps1`) into some location on your on-prem system.
2. Fill in all required configuration variables at the start of the script.
3. Test the transfer by running `.\bacpac_upload.ps1` from PowerShell.
4. Set up the Scheduled Task if needed.

## Setting up the Scheduled Task
If you wish to run the script regularly, you need to set up the Scheduled Task (using the Task Scheduler tool).

Start the `Task Scheduler` (find it via the Start menu):
1. Click on `Create Basic Task` (in the `Action` menu).
2. Choose the required period (probably `Weekly`, shorter might cause problems). And follow the wizard.
3. In `Action`, choose `Start a Program`.
4. As `Program`, write `powershell`, and as `Add argument` write `-File LOCATION_OF_PS1_SCRIPT_FILE` - and fill in the location of the script instead of `LOCATION_OF_PS1_SCRIPT_FILE`.
