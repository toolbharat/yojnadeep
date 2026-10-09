# Fix garbled Hindi text in yojana pages
$garbled = "à¤¯à¥‹à¤œà¤¨à¤¾à¤“à¤‚ à¤•à¤¾ à¤¦à¥€à¤ª"
$correct = "योजनाओं का दीप"

$files = Get-ChildItem "yojana\*.html"
$fixed = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    if ($content.Contains($garbled)) {
        $newContent = $content.Replace($garbled, $correct)
        [System.IO.File]::WriteAllText($file.FullName, $newContent, (New-Object System.Text.UTF8Encoding $false))
        Write-Host "  Fixed: $($file.Name)" -ForegroundColor Green
        $fixed++
    }
}

Write-Host ""
Write-Host "Total fixed: $fixed" -ForegroundColor Cyan