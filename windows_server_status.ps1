$ServerList = @("Server01","Server02","Server03")
foreach ($server in $ServerList) {
    if (Test-Connection -ComputerName $server -Count 2 -Quiet) {
        Write-Host "$server is ONLINE ✅"
    } else {
        Write-Host "$server is OFFLINE ⚠️"
    }
}