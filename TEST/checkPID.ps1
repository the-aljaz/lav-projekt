Set-Location -Path "D:\workspaces\python projects\lav-projekt\TEST"
$testpid = Get-Content "testPID.txt"
$testpid = $testpid.Trim()    # odstrani kere koli presledke ali tabulatorje

try {
    $proc = Get-Process -Id $testpid -ErrorAction Stop    # proba, ce je process se ziv
    Write-Host "process je alive"
}
catch {
    Write-Host "process je dead"
}