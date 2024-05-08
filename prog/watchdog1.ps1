Set-Location -Path "$HOME\ProcessManagementUtility\"
$PID > "wd1pid.txt"
while ($true) {
    #! WATCHDOG0
    try {
        $wd0pid = Get-Content "wd0pid.txt"
        $wd0pid = $wd0pid.Trim()    # odstrani kere koli presledke ali tabulatorje
        $wd0proc = Get-Process -Id $wd0pid -ErrorAction Stop    # proba, ce je watchdog0 se ziv
    }
    catch {   # ce proces ne obstaja
        Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './watchdog0.ps1'"
        $error.clear()
        $do_next = $true
        while($do_next) {
            try {
                $wd0pid = Get-Content "wd0pid.txt"
                $wd0pid = $wd0pid.Trim()    # odstrani kere koli presledke ali tabulatorje
                $wd0proc = Get-Process -Id $wd0pid -ErrorAction Stop    # proba, ce je watchdog0 se ziv
            }
            catch {
                continue
            }
            $do_next = $false
        }
    }
    #! DELAY DA NI PREVEC ZA PROCESOR
    Start-Sleep -Milliseconds 100
}
