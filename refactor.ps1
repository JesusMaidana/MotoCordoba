$ErrorActionPreference = "Stop"

$html = Get-Content -Raw "cordoba-moto-trip.html"
$html = $html -replace '(?s)<style>.*?</style>', '<link rel="stylesheet" href="./css/styles.css">'
$html = $html -replace '(?s)<script>.*?</script>', '<script src="./js/main.js"></script>'

$html = $html.Replace('<button class="tab-btn active" onclick="switchTab(''it2'')">2 días</button>', '<button class="tab-btn" onclick="switchTab(''it2'')">2 días</button>')
$html = $html.Replace('<button class="tab-btn" onclick="switchTab(''it3'')">3 días</button>', '<button class="tab-btn active" onclick="switchTab(''it3'')">3 días</button>')

$html = $html.Replace('<div class="itinerario active" id="it2">', '<div class="itinerario" id="it2">')
$html = $html.Replace('<div class="itinerario" id="it3">', '<div class="itinerario active" id="it3">')

Set-Content "index.html" -Value $html -Encoding UTF8
Remove-Item "cordoba-moto-trip.html"

git init
git add .
git commit -m "Refactor: separate HTML, CSS, JS and set 3-days itinerary as default"
git branch -M main
git remote add origin git@github.com:JesusMaidana/MotoCordoba.git
git push -u origin main
