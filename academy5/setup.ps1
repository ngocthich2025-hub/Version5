$ErrorActionPreference='Stop'
Set-Location $PSScriptRoot
if (!(Test-Path .env)) {
  $db=Read-Host 'PostgreSQL password' -AsSecureString
  $admin=Read-Host 'New admin password (at least 12 characters)' -AsSecureString
  $p=[System.Net.NetworkCredential]::new('', $db).Password
  $a=[System.Net.NetworkCredential]::new('', $admin).Password
  if($a.Length -lt 12 -or [Text.Encoding]::UTF8.GetByteCount($a) -gt 72 -or $a.Contains('"') -or $a.Contains('`n')) {throw 'Use 12-72 bytes, no double quotes'}
  $secret=node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
  $url='postgresql://postgres:'+ [Uri]::EscapeDataString($p)+'@localhost:5432/bich_ngoc_academy_v5'
  @("DATABASE_URL=$url","SESSION_SECRET=$secret",('ADMIN_PASSWORD="'+$a+'"'),'APP_ORIGIN=http://localhost:8000','PORT=8000','NODE_ENV=development') | Set-Content .env -Encoding ASCII
}
npm.cmd install
if($LASTEXITCODE -ne 0){throw 'npm install failed'}
npm.cmd start
