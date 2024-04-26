# Change the current directory
Set-Location -Path "$HOME\ProcessManagementUtility"
$PID > "rrpid.txt"
# Run the curl command
curl.exe -sN http://rick.jachan.dev