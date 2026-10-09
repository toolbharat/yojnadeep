# YojnaDeep Auto Generator v2
$ErrorActionPreference = "Stop"
$csvFile = "yojana-data.csv"
$indexFile = "yojana\index.html"
$sitemapFile = "sitemap.xml"
$templateFile = "_template.html"
$baseUrl = "https://yojnadeep.pixsathi.in"

Write-Host ""
Write-Host "YojnaDeep Auto Generator" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $csvFile)) { Write-Host "CSV nahi mila!" -ForegroundColor Red; exit }
if (-not (Test-Path $templateFile)) { Write-Host "Template nahi mila!" -ForegroundColor Red; exit }

$yojanas = Import-Csv $csvFile
$template = Get-Content $templateFile -Raw -Encoding UTF8

Write-Host "CSV mein $($yojanas.Count) yojanas" -ForegroundColor Yellow
Write-Host ""

# Naye pages banao
$created = 0
$skipped = 0
foreach ($y in $yojanas) {
    $filePath = "yojana\" + $y.filename + ".html"
    if (Test-Path $filePath) { $skipped++; continue }

    $html = $template
    $html = $html.Replace('{{TITLE}}', $y.title)
    $html = $html.Replace('{{DESCRIPTION}}', $y.description)
    $html = $html.Replace('{{FILENAME}}', $y.filename)
    $html = $html.Replace('{{MINISTRY}}', $y.ministry)
    $html = $html.Replace('{{CATEGORY}}', $y.category)
    $html = $html.Replace('{{LAUNCH}}', $y.launch)
    $html = $html.Replace('{{WEBSITE}}', $y.website)
    $html = $html.Replace('{{HELPLINE}}', $y.helpline)
    $html = $html.Replace('{{BASEURL}}', $baseUrl)

    $fullPath = Join-Path (Get-Location) $filePath
[System.IO.File]::WriteAllText($fullPath, $html, (New-Object System.Text.UTF8Encoding $false))
    Write-Host "  Created: $($y.filename).html" -ForegroundColor Green
    $created++
}
Write-Host "Pages: $created created, $skipped skipped" -ForegroundColor Cyan
Write-Host ""

# index.html mein cards add karo (SAFE)
$content = Get-Content $indexFile -Raw -Encoding UTF8
$cardsAdded = 0
$newCardsHtml = ""
foreach ($y in $yojanas) {
    $needle = 'href="' + $y.filename + '.html"'
    if ($content.Contains($needle)) { continue }
    $newCardsHtml += '            <a href="' + $y.filename + '.html" class="card">' + "`r`n"
    $newCardsHtml += '                <div class="card-icon">' + $y.icon + '</div>' + "`r`n"
    $newCardsHtml += '                <h3>' + $y.title + '</h3>' + "`r`n"
    $newCardsHtml += '                <p>' + $y.description + '</p>' + "`r`n"
    $newCardsHtml += '                <span class="card-cta">Read More &rarr;</span>' + "`r`n"
    $newCardsHtml += '            </a>' + "`r`n`r`n"
    $cardsAdded++
}
if ($cardsAdded -gt 0) {
    Copy-Item $indexFile ($indexFile + ".bak-auto") -Force
    if ($content -match "(?s)(.*)(\s+</div>\s+</section>\s+</main>)") {
        $updated = $Matches[1] + "`r`n" + $newCardsHtml + $Matches[2]
        Set-Content -Path $indexFile -Value $updated -Encoding UTF8 -NoNewline
        Write-Host "  $cardsAdded cards added to index.html" -ForegroundColor Green
    }
} else {
    Write-Host "  No new cards needed" -ForegroundColor Yellow
}

# Sitemap update
$sitemapContent = Get-Content $sitemapFile -Raw -Encoding UTF8
$urlsAdded = 0
$newUrls = ""
foreach ($y in $yojanas) {
    $needle = "$baseUrl/yojana/" + $y.filename + ".html"
    if ($sitemapContent.Contains($needle)) { continue }
    $newUrls += "  <url>`r`n    <loc>$needle</loc>`r`n    <changefreq>monthly</changefreq>`r`n    <priority>0.8</priority>`r`n  </url>`r`n"
    $urlsAdded++
}
if ($urlsAdded -gt 0) {
    Copy-Item $sitemapFile ($sitemapFile + ".bak-auto") -Force
    if ($sitemapContent -match "(?s)(.*)(</urlset>)") {
        $updated = $Matches[1] + $newUrls + $Matches[2]
        Set-Content -Path $sitemapFile -Value $updated -Encoding UTF8 -NoNewline
        Write-Host "  $urlsAdded URLs added to sitemap.xml" -ForegroundColor Green
    }
} else {
    Write-Host "  Sitemap up to date" -ForegroundColor Yellow
}

# Git push
Write-Host ""
Write-Host "Git check..." -ForegroundColor Cyan
$gitStatus = git status --porcelain
if ($gitStatus) {
    git add .
    git commit -m "Auto: Update yojana pages" | Out-Null
    git push | Out-Null
    Write-Host "  Pushed to GitHub" -ForegroundColor Green
} else {
    Write-Host "  No changes" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "DONE!" -ForegroundColor Green
Write-Host "   Pages: $created  |  Cards: $cardsAdded  |  URLs: $urlsAdded" -ForegroundColor White
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""