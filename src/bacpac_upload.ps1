# SAS to bacpac storage (needs to have perms: Write, Add, Imutable storage)
$BLOB_SAS_URL = "TODO: Change"
# Path to the landing folder with bacpac files
$PATH_STORAGE = "TODO: Change"
# ~~~ END OF CONFIGURATION SECTION ~~~

# === FIND AVAILABLE FILES ===
# List all bacpac files in the folder
$available_files = Get-ChildItem -Path $PATH_STORAGE -Name -Include *.bacpac
# Check if there is at least one file available
if ( $available_files.Count -eq 1 ) {
    Write-Host "There is no .bacpac file available in the landing folder"
}
# In the case there are multiple files in the landing folder
if ( $available_files.Count -gt 1 ) {
    # This works correctly only if the array has at least 2 elements
    $available_files = ($available_files | Sort-Object -Descending)
    $latest_file = $available_files[0]
}
else {
    # Select the latest file to be transferred
    $latest_file = $available_files
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# === TRANSFER FILE TO THE BLOB STORAGE
azcopy copy "$PATH_STORAGE\$latest_file" "$BLOB_SAS_URL"
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
