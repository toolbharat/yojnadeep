# Add favicon links to all yojana pages
$faviconLinks = @"
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="manifest" href="/site.webmanifest">
"@

# Yojana pages
$files = Get-ChildItem "yojana\*.html"
$fixed = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    if ($content.Contains("favicon.ico")) {
        continue
    }
    
    if ($content.Contains("<meta charset=`"UTF-8`">")) {
        $newContent = $content.Replace("<meta charset=`"UTF-8`">", "<meta charset=`"UTF-8`">`r`n" + $faviconLinks)
        [System.IO.File]::WriteAllText($file.FullName, $newContent, (New-Object System.Text.UTF8Encoding $false))
        Write-Host "  Fixed: $($file.Name)" -ForegroundColor Green
        $fixed++
    }
}

# Root pages
$rootFiles = Get-ChildItem "*.html"
foreach ($file in $rootFiles) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    if ($content.Contains("favicon.ico")) {
        continue
    }
    
    if ($content.Contains("<meta charset=`"UTF-8`">")) {
        $newContent = $content.Replace("<meta charset=`"UTF-8`">", "<meta charset=`"UTF-8`">`r`n" + $faviconLinks)
        [System.IO.File]::WriteAllText($file.FullName, $newContent, (New-Object System.Text.UTF8Encoding $false))
        Write-Host "  Fixed: $($file.Name)" -ForegroundColor Green
        $fixed++
    }
}

Write-Host ""
Write-Host "Total fixed: $fixed" -ForegroundColor Cyan