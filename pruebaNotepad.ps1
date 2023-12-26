Start-Process 'C:\windows\system32\notepad.exe' -Wait

$wshell = New-Object -ComObject wscript.shell;
Start-Sleep -Seconds 2
$wshell.sendkeys("^s")
Start-Sleep -Seconds 2
$wshell.sendkeys("j")
Start-Sleep -Seconds 2
$wshell.sendkeys("j")
Start-Sleep -Seconds 1
$wshell.sendkeys("{ENTER}")
Start-Sleep -Seconds 2
$wshell.sendkeys("%{F4}")
Start-Sleep -Seconds 2
