Start-Process 'C:\windows\system32\notepad.exe' -Wait

$WShell = New-Object -com "Wscript.Shell"
$WShell.sendkeys("Hola")
Start-Sleep -Seconds 2
$WShell.sendkeys("^a")
Start-Sleep -Seconds 2
$WShell.sendkeys("^s")
Start-Sleep -Seconds 2
$WShell.sendkeys("j")
Start-Sleep -Seconds 2
$WShell.sendkeys("j")
Start-Sleep -Seconds 1
$WShell.sendkeys("{ENTER}")
Start-Sleep -Seconds 2
$WShell.sendkeys("%{F4}")
Start-Sleep -Seconds 2
