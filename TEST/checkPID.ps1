Set-Location -Path "$HOME\ProcessManagementUtility\"
# Get the process by its PID
$procid = Get-Content "testPID.txt"
$procid = $procid.Trim()    # Remove any leading or trailing spaces or tabs
$process = Get-Process -Id $procid -ErrorAction SilentlyContinue

# Check if the process is running
if ($null -ne $process) {
    Write-Host "The process is running."
}
else {
    Write-Host "The process is not running."
}