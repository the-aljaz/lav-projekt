Set-Location -Path "$HOME\ProcessManagementUtility\"
$PID > "wd1pid.txt"
Start-Sleep -Seconds 1
while ($true) {
    #! WATCHDOG0
    $wd0pid = Get-Content wd0pid.txt
    $wd0pid = $wd0pid.Trim()    # odstrani kere koli presledke ali tabulatorje
    try {
        $wd0proc = Get-Process -Id $wd0pid -ErrorAction SilentlyContinue    # proba, ce je watchdog0 se ziv
    }
    catch {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog0.ps1'"
    }
    #! DELAY DA NI PREVEC ZA PROCESOR
    Start-Sleep -Milliseconds 50
}