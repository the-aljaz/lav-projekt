Set-Location -Path "$HOME\ProcessManagementUtility\"
./getPID.bat > wd0pid   #da svoj pid u file
while ($true) {
    #! WATCHDOG1
    $wd1pid = Get-Content wd1pid
    $wd1pid = $wd1pid.Trim()    # odstrani kere koli presledke ali tabulatorje
    $wd1proc = Get-Process -Id $wd0pid -ErrorAction SilentlyContinue    # proba, ce je watchdog1 se ziv
    if ($wd1proc -eq $null) {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog1.ps1'"
    }
    #! RICKROLL
    $rrpid = Get-Content rrpid
    $rrpid = $rrpid.Trim()    # odstrani kere koli presledke ali tabulatorje
    $rrproc = Get-Process -Id $rrpid -ErrorAction SilentlyContinue    # proba, ce je rickroll se ziv
    if ($rrproc -eq $null) {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './rickroll.bat'"
    }
    #! SOUND
    $spid = Get-Content spid
    $spid = $spid.Trim()    # odstrani kere koli presledke ali tabulatorje
    $sproc = Get-Process -Id $spid -ErrorAction SilentlyContinue    # proba, ce je sound se ziv
    if ($sproc -eq $null) {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './sound.ps1'"
    }
    #! DELAY DA NI PREVEC ZA PROCESOR
    Start-Sleep -Milliseconds 50
}