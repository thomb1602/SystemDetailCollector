# get system details

# Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName
# Get-CimInstance -ClassName Win32_ComputerSystem -Property Name
# Get-CimInstance -ClassName Win32_ComputerSystem -Property Model
# Get-WmiObject win32_bios | Select-Object Serialnumber

$username = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName
$pcName = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
$pcModel = (Get-CimInstance -ClassName Win32_ComputerSystem).Model
$serialNumber = (Get-WmiObject win32_bios).Serialnumber

Write-Host "Username: " $username
Write-Host "PC Name: " $pcName
Write-Host "PC Model: " $pcModel
Write-Host "Serial Number: " $serialNumber