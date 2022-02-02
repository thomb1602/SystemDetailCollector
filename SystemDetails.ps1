# get system details
$username = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName
$pcName = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
$pcModel = (Get-CimInstance -ClassName Win32_ComputerSystem).Model
$serialNumber = (Get-WmiObject win32_bios).Serialnumber

Write-Host "Username: " $username
Write-Host "PC Name: " $pcName
Write-Host "PC Model: " $pcModel
Write-Host "Serial Number: " $serialNumber