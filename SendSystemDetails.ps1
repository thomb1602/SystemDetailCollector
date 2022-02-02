# get system details
$username = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName
$pcName = (Get-CimInstance -ClassName Win32_ComputerSystem).Name
$pcModel = (Get-CimInstance -ClassName Win32_ComputerSystem).Model
$serialNumber = (Get-WmiObject win32_bios).Serialnumber

# save details to csv file
$datetime = Get-Date
New-Item -Path . -Name "SystemInfo.csv" -ItemType "file" -Value "Username,PCName,PCModel,SerialNumber,UtcDateTime"
Add-Content -Path "SystemInfo.csv" -Value "`
$($username),$($pcName),$($pcModel),$($serialNumber),$($datetime)"

# send details in email
$Outlook = New-Object -ComObject Outlook.Application
$Mail = $Outlook.CreateItem(0)

$Mail.To = "" 
$Mail.Subject = "System details for $($username)" 
$Mail.Body = "Username: $($username) `
PC Name: $($pcName) `
PC Model: $($pcModel) `
Serial Number: $($serialNumber)"
$file = "$($PSScriptRoot)\SystemInfo.csv"
$Mail.Attachments.Add($file)

#send message
$Mail.Send()