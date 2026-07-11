$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$archive = "images\headscale-stack.tar.gz"
if (-not (Test-Path $archive)) {
  throw "Missing $archive"
}

Write-Host "Loading Docker images from $archive ..."
docker load -i $archive

Write-Host "Starting stack..."
docker compose up -d

Write-Host ""
Write-Host "Done."
Write-Host "  UI:  http://SERVER_IP:3000"
Write-Host "  API: http://SERVER_IP:8080"
Write-Host ""
Write-Host "Important: edit config/*.yaml and set server_url / base_url / public_url"
Write-Host "to your real server IP or domain, then run: docker compose up -d"
