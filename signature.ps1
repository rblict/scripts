param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath,
    [string]$Description = "Auto-signed by Sunny's IT Automation Framework"
)

$scriptName = Split-Path $FilePath -Leaf
$date = Get-Date -Format "yyyy-MM-dd"
$version = "1.0.0"

# Check if already signed
if (Select-String -Path $FilePath -Pattern "Signature\s*:") {
    Write-Host "🟡 Already signed: $FilePath"
    return
}

$header = @"
# ============================================================
# Script Name   : $scriptName
# Author        : Sunny [SPO-IT] – Government Commercial Bank]
# Department    : IT Infrastructure & param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath,
    [string]$Description = "Auto-signed by Sunny's IT Automation Framework"
)

$scriptName = Split-Path $FilePath -Leaf
$date = Get-Date -Format "yyyy-MM-dd"
$version = "1.0.0"

# Check if already signed
if (Select-String -Path $FilePath -Pattern "Signature\s*:") {
    Write-Host "🟡 Already signed: $FilePath"
    return
}

$header = @"
# ============================================================
# Script Name   : $scriptName
# Author        : Sunny [IT Professional – Rupali Bank PLC.]
# Department    : IT Infrastructure & Automation
# Version       : $version
# Created On    : $date
# Signature     : ☀️ "Innovate Securely. Automate Boldly."
# ============================================================
# Description   : $Description
# ============================================================
"@

# Prepend header
$content = Get-Content $FilePath -Raw
$header + "`n" + $content | Set-Content $FilePath

# Append hash
$hash = (Get-FileHash $FilePath -Algorithm SHA256).Hash
Add-Content $FilePath "`n# Integrity Hash (SHA256): $hash"

Write-Host "✅ Signed: $FilePath" -ForegroundColor Green
# Version       : $version
# Created On    : $date
# Signature     : ☀️ "Innovate Securely. Automate Boldly."
# ============================================================
# Description   : $Description
# ============================================================
"@

# Prepend header
$content = Get-Content $FilePath -Raw
$header + "`n" + $content | Set-Content $FilePath

# Append hash
$hash = (Get-FileHash $FilePath -Algorithm SHA256).Hash
Add-Content $FilePath "`n# Integrity Hash (SHA256): $hash"

Write-Host "✅ Signed: $FilePath" -ForegroundColor Green
