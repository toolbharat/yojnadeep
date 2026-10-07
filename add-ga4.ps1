# Add GA4 to yojana pages missing it
$ErrorActionPreference = "Stop"
$ga4Id = "G-FLK6E7NJQ3"
$ga4Block = "<!-- Google tag (gtag.js) -->`r`n<script async src=""https://www.googletagmanager.com/gtag/js?id=$ga4Id""></script>`r`n<script>`r`n  window.dataLayer = window.dataLayer || [];`r`n  function gtag(){dataLayer.push(arguments);}`r`n  gtag('js', new Date());`r`n  gtag('config', '$ga4Id');`r`n</script>"

$files = Get-ChildItem "yojana\*.html"
$added = 0
$skipped = 0
$errors = 0

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    if ($content.Contains($ga4Id)) {
        $skipped++
        continue
    }
    
    if ($content.Contains("<head>")) {
        $updated = $content.Replace("<head>", "<head>`r`n" + $ga4Block)
        Set-Content -Path $file.FullName -Value $updated -Encoding UTF8 -NoNewline
        Write-Host "  Added: $($file.Name)" -ForegroundColor Green
        $added++
    } else {
        Write-Host "  NO HEAD: $($file.Name)" -ForegroundColor Red
        $errors++
    }
}

Write-Host ""
Write-Host "Added: $added | Skipped: $skipped | Errors: $errors" -ForegroundColor Cyan
Write-Host ""

# Git push
$status = git status --porcelain
if ($status) {
    git add .
    git commit -m "Add GA4 tracking to remaining yojana pages" | Out-Null
    git push | Out-Null
    Write-Host "Pushed to GitHub" -ForegroundColor Green
} else {
    Write-Host "No changes" -ForegroundColor Yellow
}