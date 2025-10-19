# Get-SystemInfo.ps1
# PowerShell script to collect system and license information and save to a text file

# Define output paths
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$outputTxt = "$env:USERPROFILE\Documents\System_Report_$timestamp.txt"

# Collect system info
Write-Output "Collecting system information..."
systeminfo | Out-File -FilePath $outputTxt -Append

# Collect license info
Write-Output "`nCollecting Windows license info..."
cscript.exe /nologo "$env:SystemRoot\System32\slmgr.vbs" /dli | Out-File -FilePath $outputTxt -Append
cscript.exe /nologo "$env:SystemRoot\System32\slmgr.vbs" /xpr | Out-File -FilePath $outputTxt -Append

# Collect disk info
Write-Output "`nCollecting disk info..."
Get-PSDrive | Where-Object {$_.Provider -like "Microsoft.PowerShell.Core\FileSystem"} | Format-Table Name,Used,Free,Root | Out-File -FilePath $outputTxt -Append

# Collect network info
Write-Output "`nCollecting network info..."
ipconfig /all | Out-File -FilePath $outputTxt -Append

# Collect BIOS info
Write-Output "`nCollecting BIOS info..."
Get-WmiObject Win32_BIOS | Format-List | Out-File -FilePath $outputTxt -Append

# Collect CPU info
Write-Output "`nCollecting CPU info..."
Get-WmiObject Win32_Processor | Format-List | Out-File -FilePath $outputTxt -Append

# Collect RAM info
Write-Output "`nCollecting RAM info..."
Get-WmiObject Win32_PhysicalMemory | Format-Table Capacity,Speed,Manufacturer | Out-File -FilePath $outputTxt -Append

# Collect GPU info
Write-Output "`nCollecting GPU info..."
Get-WmiObject Win32_VideoController | Format-Table Name,DriverVersion | Out-File -FilePath $outputTxt -Append

Write-Output "System report saved to: $outputTxt"
