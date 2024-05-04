Set-Location -Path "$HOME\ProcessManagementUtility\"
$PID > "wd0pid.txt"   #da svoj pid u file  
while ($true) {
    #! WATCHDOG1
    $wd1pid = Get-Content "wd1pid.txt"
    $wd1pid = $wd1pid.Trim()    # odstrani kere koli presledke ali tabulatorje
    try {
        $wd1proc = Get-Process -Id $wd0pid -ErrorAction Stop    # proba, ce je watchdog1 se ziv
    }
    catch {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog1.ps1'"
    }
    #! RICKROLL
    $rrpid = Get-Content "rrpid.txt"
    $rrpid = $rrpid.Trim()    # odstrani kere koli presledke ali tabulatorje
    try {
        $rrproc = Get-Process -Id $rrpid -ErrorAction Stop    # proba, ce je rickroll se ziv
    }
    catch {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-Command & './rickroll.ps1'"
    }
    #! SOUND
    $spid = Get-Content "spid.txt"
    $spid = $spid.Trim()    # odstrani kere koli presledke ali tabulatorje
    try {
        $sproc = Get-Process -Id $spid -ErrorAction Stop    # proba, ce je sound se ziv
    }
    catch {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './sound.ps1'"
    }
    #! DELAY DA NI PREVEC ZA PROCESOR
    Start-Sleep -Milliseconds 50
}