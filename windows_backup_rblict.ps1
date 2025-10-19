$Source = "C:\RBLICT\Data"
$Destination = "D:\Backup\RBLICT_$(Get-Date -Format yyyy-MM-dd)"
New-Item -ItemType Directory -Force -Path $Destination
Copy-Item -Path "$Source\*" -Destination $Destination -Recurse
Write-Host "Backup completed at $Destination" 