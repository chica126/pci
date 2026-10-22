# Jalankan dari dalam folder ini:  powershell -ExecutionPolicy Bypass -File download-images.ps1
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Set-Location $PSScriptRoot
New-Item -ItemType Directory -Force -Path images | Out-Null
$ua = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"
$list = @(
  @("images/brand-braveheart-logo.png","https://braveheart.co.id/wp-content/uploads/2025/08/Logo-Braveheart-Horizontal-1.png"),
  @("images/hero-cathlab.webp","https://braveheart.co.id/wp-content/uploads/2024/09/WhatsApp-Image-2024-10-22-at-13.55.59.webp"),
  @("images/strip-award.png","https://braveheart.co.id/wp-content/uploads/2025/10/logo-award-2-1024x329.png"),
  @("images/tech-ivus-oct.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/IVUS-Intravascular-Ultrasound-1024x704.jpg"),
  @("images/tech-rotablator-oas.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/New-Advanced-Technology.jpg"),
  @("images/doctor-todung-silalahi.jpg","https://braveheart.co.id/wp-content/uploads/elementor/thumbs/Dr.-dr-Todung-Silalahi-SpPD-KKV-scaled-rmy7cbfxmp7qc6vm3f4450b3u5y5qe1qwcqscx4zb4.jpg"),
  @("images/doctor-simon-salim.jpg","https://braveheart.co.id/wp-content/uploads/elementor/thumbs/Dr.-Simon-Salim-Sp.PD-KKV-1-scaled-rmy7cbfxmp7qc6vm3f4450b3u5y5qe1qwcqscx4zb4.jpg"),
  @("images/doctor-vienna-rossimarina.jpg","https://braveheart.co.id/wp-content/uploads/elementor/thumbs/dr.-Vienna-Rossimarina-Sp.JPK_-scaled-rmy7cbfxmp7qc6vm3f4450b3u5y5qe1qwcqscx4zb4.jpg"),
  @("images/insurance-prudential-priority.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/pru_prior_igf_rspb_sep_2023_500px.jpg"),
  @("images/insurance-allianz-blue-eagle.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/blue-eagle.jpg"),
  @("images/insurance-partner-01.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/1.jpg"),
  @("images/insurance-partner-02.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/2.jpg"),
  @("images/insurance-partner-03.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/3.jpg"),
  @("images/insurance-partner-04.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/4.jpg"),
  @("images/insurance-partner-05.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/5.jpg"),
  @("images/insurance-partner-06.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/6.jpg"),
  @("images/insurance-partner-07.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/7.jpg"),
  @("images/insurance-partner-08.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/8.jpg"),
  @("images/insurance-partner-09.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/9.jpg"),
  @("images/insurance-partner-10.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/10.jpg"),
  @("images/insurance-partner-11.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/11.jpg"),
  @("images/insurance-partner-12.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/12.jpg"),
  @("images/insurance-partner-13.jpg","https://braveheart.co.id/wp-content/uploads/2025/10/13.jpg"),
  @("images/luarkota-konsultasi-wa.jpg","https://brwimage.carrd.co/assets/images/image03.jpg?v=30c41e60"),
  @("images/luarkota-penjemputan.jpg","https://brwimage.carrd.co/assets/images/image02.jpg?v=30c41e60"),
  @("images/luarkota-akomodasi.jpg","https://brwimage.carrd.co/assets/images/image05.jpg?v=58a4c578"),
  @("images/bw-tim-dokter.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2Fbb5fb857-06b3-4a0d-a240-333817d0c622&width=600&format=webp&quality=50"),
  @("images/bw-teknologi.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F679a3762-5ece-4d9e-8cd7-860243b7e899&width=600&format=webp&quality=50&fit=cover"),
  @("images/bw-pelayanan-heart.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F9d3e50bb-e13f-47e8-9038-748ea859fbf9&width=600&format=webp&quality=50&fit=cover"),
  @("images/bw-akreditasi.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F41ae2435-34ae-4b4c-9e22-a910c0a2312a&width=600&format=webp&quality=50&fit=cover"),
  @("images/award-most-trusted-2026.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F5a36ae87-5549-48a0-9b20-89e4ac38b96f&width=600&format=webp&quality=50&fit=cover"),
  @("images/award-cnn-2026.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2Fc13423db-4e78-457b-a06a-782cce0fd9bd&width=600&format=webp&quality=50&fit=cover"),
  @("images/award-cnbc-heartcare-2024.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F0e6da164-9e8f-42e1-92f3-41a84527f913&width=600&format=webp&quality=50&fit=cover"),
  @("images/award-cnn-wellnest-2026.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F1c15a584-dc4f-47bf-8022-b5323de503f4&width=600&format=webp&quality=50&fit=cover"),
  @("images/award-indomedex-2026.webp","https://brawijayahospital.com/api/proxy?service=internal&path=assets%2F944f9944-7ecd-4bfb-a560-6c788c8ec17f&width=600&format=webp&quality=50&fit=cover")
)
$ok=0; $fail=0
foreach ($i in $list) {
  if ((Test-Path $i[0]) -and ((Get-Item $i[0]).Length -gt 1000)) { Write-Host "ADA  $($i[0])"; $ok++; continue }
  try { Invoke-WebRequest -Uri $i[1] -OutFile $i[0] -UseBasicParsing -UserAgent $ua -Headers @{Referer="https://braveheart.co.id/"}; Write-Host "OK   $($i[0])"; $ok++ }
  catch { Write-Host "GAGAL $($i[0]) - $($_.Exception.Message)"; $fail++ }
}
Write-Host ""
Write-Host "Selesai: $ok berhasil, $fail gagal."
