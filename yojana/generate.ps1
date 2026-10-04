# ========================================
# YojnaDeep - 20 Yojana Pages Generator
# ========================================

$pages = @(
    @{ file="pm-fasal-bima.html"; icon="🌾"; title="PM Fasal Bima Yojana"; ministry="Agriculture"; cat="Farmer Welfare"; launch="February 2016"; tagline="फसल बीमा योजना - प्राकृतिक आपदा से सुरक्षा"; website="https://pmfby.gov.in"; helpline="14447" },
    @{ file="atal-pension.html"; icon="👴"; title="Atal Pension Yojana"; ministry="Finance"; cat="Pension"; launch="May 2015"; tagline="60 साल के बाद मिलेगी पेंशन"; website="https://npscra.nsdl.co.in"; helpline="1800-110-069" },
    @{ file="pm-jan-dhan.html"; icon="🏦"; title="PM Jan Dhan Yojana"; ministry="Finance"; cat="Banking"; launch="August 2014"; tagline="हर परिवार का बैंक खाता"; website="https://pmjdy.gov.in"; helpline="1800-11-0001" },
    @{ file="pm-ujjwala.html"; icon="🔥"; title="PM Ujjwala Yojana"; ministry="Petroleum"; cat="Women Welfare"; launch="May 2016"; tagline="गरीब महिलाओं को मुफ्त LPG कनेक्शन"; website="https://pmuy.gov.in"; helpline="1800-266-6696" },
    @{ file="pm-suraksha-bima.html"; icon="🛡️"; title="PM Suraksha Bima Yojana"; ministry="Finance"; cat="Insurance"; launch="May 2015"; tagline="₹2 लाख दुर्घटना बीमा"; website="https://jansuraksha.gov.in"; helpline="1800-180-1111" },
    @{ file="pm-jeevan-jyoti.html"; icon="💙"; title="PM Jeevan Jyoti Bima Yojana"; ministry="Finance"; cat="Insurance"; launch="May 2015"; tagline="₹2 लाख जीवन बीमा"; website="https://jansuraksha.gov.in"; helpline="1800-180-1111" },
    @{ file="beti-bachao.html"; icon="👧"; title="Beti Bachao Beti Padhao"; ministry="Women & Child"; cat="Girl Child"; launch="January 2015"; tagline="बेटी बचाओ, बेटी पढ़ाओ"; website="https://wcd.gov.in"; helpline="1098" },
    @{ file="kisan-credit-card.html"; icon="💳"; title="Kisan Credit Card"; ministry="Agriculture"; cat="Farmer Welfare"; launch="August 1998"; tagline="किसानों के लिए आसान लोन"; website="https://agriwelfare.gov.in"; helpline="1800-180-1551" },
    @{ file="pm-kisan-maan-dhan.html"; icon="👨‍🌾"; title="PM Kisan Maan Dhan Yojana"; ministry="Agriculture"; cat="Pension"; launch="September 2019"; tagline="किसानों को ₹3000 मासिक पेंशन"; website="https://maandhan.in"; helpline="1800-267-6888" },
    @{ file="pm-garib-kalyan.html"; icon="🍚"; title="PM Garib Kalyan Anna Yojana"; ministry="Consumer Affairs"; cat="Food Security"; launch="March 2020"; tagline="गरीबों को मुफ्त राशन"; website="https://dfpd.gov.in"; helpline="1967" },
    @{ file="pm-vishwakarma.html"; icon="🔨"; title="PM Vishwakarma Yojana"; ministry="MSME"; cat="Artisan"; launch="September 2023"; tagline="कारीगरों को लोन और ट्रेनिंग"; website="https://pmvishwakarma.gov.in"; helpline="1800-267-7777" },
    @{ file="pm-poshan.html"; icon="🍎"; title="PM Poshan Shakti Nirman"; ministry="Education"; cat="Nutrition"; launch="August 2021"; tagline="स्कूली बच्चों को पौष्टिक भोजन"; website="https://pmposhan.education.gov.in"; helpline="1800-11-8000" },
    @{ file="ladli-behna.html"; icon="👩"; title="Ladli Behna Yojana"; ministry="Madhya Pradesh Govt"; cat="Women Welfare"; launch="June 2023"; tagline="MP महिलाओं को ₹1250 मासिक"; website="https://cmladlibahna.mp.gov.in"; helpline="0755-2700800" },
    @{ file="kanya-sumangala.html"; icon="🎀"; title="Kanya Sumangala Yojana"; ministry="UP Govt"; cat="Girl Child"; launch="2019"; tagline="UP बेटियों को ₹25,000 तक"; website="https://mksy.up.gov.in"; helpline="1800-180-5333" },
    @{ file="ration-card.html"; icon="📋"; title="Ration Card Yojana"; ministry="Consumer Affairs"; cat="Food Security"; launch="Ongoing"; tagline="खाद्य सुरक्षा के लिए राशन कार्ड"; website="https://nfsa.gov.in"; helpline="1967" },
    @{ file="pm-svanidhi.html"; icon="🛒"; title="PM SVANidhi Yojana"; ministry="Housing & Urban"; cat="Street Vendor"; launch="June 2020"; tagline="रेहड़ी-पटरी वालों को ₹50,000 लोन"; website="https://pmsvanidhi.mohua.gov.in"; helpline="1800-11-1979" },
    @{ file="mnrega.html"; icon="⚒️"; title="MGNREGA Yojana"; ministry="Rural Development"; cat="Employment"; launch="February 2006"; tagline="ग्रामीण रोज़गार गारंटी"; website="https://nrega.nic.in"; helpline="1800-345-0034" },
    @{ file="pm-matsya-sampada.html"; icon="🐟"; title="PM Matsya Sampada Yojana"; ministry="Fisheries"; cat="Fishery"; launch="September 2020"; tagline="मछुआरों की आय दुगुनी करने की योजना"; website="https://pmmsy.dof.gov.in"; helpline="1800-425-1660" },
    @{ file="ayushman-digital.html"; icon="💻"; title="Ayushman Bharat Digital Mission"; ministry="Health"; cat="Health"; launch="September 2021"; tagline="डिजिटल स्वास्थ्य ID"; website="https://abdm.gov.in"; helpline="1800-11-4477" },
    @{ file="pm-awas-urban.html"; icon="🏙️"; title="PM Awas Yojana Urban"; ministry="Housing & Urban"; cat="Housing"; launch="June 2015"; tagline="शहरी गरीबों को पक्का घर"; website="https://pmay-urban.gov.in"; helpline="011-23060484" }
)

$count = 0

foreach ($y in $pages) {
    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($y.title) 2026 - पूरी जानकारी | YojnaDeep</title>
    <meta name="description" content="$($y.title) - $($y.tagline)। Eligibility, benefits, documents, apply process, official website. पूरी जानकारी हिंदी में।">
    <meta name="keywords" content="$($y.title), सरकारी योजना, government scheme">
    <link rel="canonical" href="https://yojnadeep.pixsathi.in/yojana/$($y.file)">
    <link rel="stylesheet" href="../style.css">
</head>
<body>

<header class="header">
    <div class="container">
        <a href="../index.html" class="logo-link">
            <div class="logo">
                <span class="logo-icon">🪔</span>
                <div>
                    <div class="logo-text">YojnaDeep</div>
                    <div class="logo-tagline">योजनाओं का दीप</div>
                </div>
            </div>
        </a>
        <nav class="nav">
            <a href="../index.html">🏠 Home</a>
            <a href="../index.html#popular">📋 Yojana</a>
            <a href="../index.html#categories">📚 Categories</a>
        </nav>
    </div>
</header>

<main class="container">

    <article class="yojana-page">
        
        <div class="yojana-header">
            <h1>$($y.icon) $($y.title)</h1>
            <div class="yojana-meta">
                <span>🏛️ Ministry: $($y.ministry)</span>
                <span>📂 Category: $($y.cat)</span>
                <span>📅 Launch: $($y.launch)</span>
            </div>
        </div>

        <section class="yojana-section">
            <h2>📌 Overview</h2>
            <p><strong>$($y.title)</strong> — $($y.tagline)। यह योजना भारत सरकार द्वारा चलाई जा रही है और इसका मुख्य उद्देश्य है समाज के ज़रूरतमंद वर्गों को आर्थिक और सामाजिक सहायता प्रदान करना।</p>
            <p>इस योजना के तहत पात्र लाभार्थियों को सरकार की तरफ़ से विभिन्न प्रकार की सहायता दी जाती है — जिससे उनका जीवन स्तर ऊपर उठे और वे आत्मनिर्भर बन सकें।</p>
        </section>

        <section class="yojana-section">
            <h2>💰 Benefits</h2>
            <ul>
                <li><strong>मुख्य लाभ:</strong> $($y.tagline)</li>
                <li><strong>सरकारी सहायता:</strong> Direct Benefit Transfer के माध्यम से</li>
                <li><strong>आसान process:</strong> कम documents, सरल आवेदन</li>
                <li><strong>ऑनलाइन tracking:</strong> स्थिति घर बैठे देख सकते हैं</li>
                <li><strong>हर साल renew:</strong> जारी रहती है योजना</li>
                <li><strong>Helpline support:</strong> $($y.helpline) पर सहायता</li>
            </ul>
        </section>

        <section class="yojana-section">
            <h2>✅ Eligibility (पात्रता)</h2>
            <ul>
                <li>भारत का नागरिक होना ज़रूरी है</li>
                <li>आयु सीमा और आय सीमा — योजना के हिसाब से</li>
                <li>Aadhaar Card ज़रूरी</li>
                <li>Bank Account ज़रूरी (DBT के लिए)</li>
                <li>योजना-विशिष्ट शर्तें पूरी करनी होंगी</li>
            </ul>
        </section>

        <section class="yojana-section">
            <h2>📋 Documents Required</h2>
            <ul>
                <li>Aadhaar Card</li>
                <li>Bank Account Passbook</li>
                <li>Address Proof</li>
                <li>Income Certificate</li>
                <li>Passport size Photo</li>
                <li>Mobile Number</li>
            </ul>
        </section>

        <section class="yojana-section">
            <h2>📝 How to Apply</h2>
            <ol>
                <li>योजना की official website <a href="$($y.website)" target="_blank">$($y.website)</a> पर जाएँ</li>
                <li>"Apply" या "Registration" option चुनें</li>
                <li>अपनी details भरें (नाम, Aadhaar, mobile)</li>
                <li>Documents upload करें</li>
                <li>Submit करें और reference number save करें</li>
                <li>या नज़दीकी CSC center / office जाएँ</li>
            </ol>
        </section>

        <section class="yojana-section">
            <h2>🔗 Official Website</h2>
            <p><a href="$($y.website)" target="_blank">$($y.website)</a></p>
            <p>Helpline: <strong>$($y.helpline)</strong></p>
        </section>

        <section class="yojana-section">
            <h2>❓ FAQ</h2>
            
            <h3>Q: क्या मैं पात्र हूँ?</h3>
            <p>A: Official website पर eligibility check कर सकते हैं। आमतौर पर भारत के नागरिक जो आय सीमा के अंदर हैं, पात्र हैं।</p>

            <h3>Q: Apply करने के लिए कितना खर्च है?</h3>
            <p>A: योजना apply करना पूरी तरह मुफ्त है।</p>

            <h3>Q: कितने दिनों में approval मिलता है?</h3>
            <p>A: आमतौर पर 15-30 दिनों में verification और approval हो जाता है।</p>

            <h3>Q: Status कैसे check करें?</h3>
            <p>A: Official website पर "Track Application" section से check कर सकते हैं।</p>

            <h3>Q: पैसा कैसे मिलता है?</h3>
            <p>A: Direct Bank Transfer (DBT) के माध्यम से सीधे आपके बैंक खाते में।</p>

            <h3>Q: किससे मदद ले सकते हैं?</h3>
            <p>A: Helpline <strong>$($y.helpline)</strong> या नज़दीकी CSC center।</p>
        </section>

        <section class="yojana-section">
            <h2>🔗 Related Yojanas</h2>
            <ul>
                <li><a href="../index.html#popular">सभी प्रमुख योजनाएँ देखें</a></li>
                <li><a href="pm-kisan.html">PM Kisan Samman Nidhi</a></li>
                <li><a href="ayushman-bharat.html">Ayushman Bharat</a></li>
            </ul>
        </section>

    </article>

</main>

<footer class="footer">
    <div class="container">
        <p>&copy; 2026 YojnaDeep | योजनाओं का दीप</p>
        <p>
            <a href="../index.html">Home</a> ·
            <a href="../index.html#popular">Yojana</a> ·
            <a href="../index.html#about">About</a>
        </p>
    </div>
</footer>

</body>
</html>
"@
    
    Set-Content -Path "yojana\$($y.file)" -Value $html -Encoding UTF8
    Write-Host "Created: $($y.file)" -ForegroundColor Green
    $count++
}

Write-Host ""
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host "  COMPLETE! $count files created" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""
Get-ChildItem yojana | Format-Table Name, Length -AutoSize