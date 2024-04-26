Set-Location -Path "$HOME\ProcessManagementUtility\"
$PID > "testPID.txt"
while ($true) {
    Start-Sleep -Seconds 5
}
