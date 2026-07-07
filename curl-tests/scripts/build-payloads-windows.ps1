param(
	[Parameter(Mandatory = $true)]
	[string]$User,

	[Parameter(Mandatory = $true)]
	[string]$Pwd
)

$RootDir = Split-Path -Parent $PSScriptRoot
$TemplateDir = Join-Path $RootDir "templates"
$GeneratedDir = Join-Path $RootDir "generated"

New-Item -ItemType Directory -Force -Path $GeneratedDir | Out-Null

Get-ChildItem -Path $TemplateDir -File | ForEach-Object {
	$OutputName = $_.Name -replace '\.tpl$', ''
	$OutputPath = Join-Path $GeneratedDir $OutputName
	$Content = Get-Content -LiteralPath $_.FullName -Raw
	$Content = $Content.Replace('#TIMM-API-USERNAME#', $User).Replace('#TIMM-API-PASSWORD#', $Pwd)
	Set-Content -LiteralPath $OutputPath -Value $Content -Encoding UTF8
	Write-Host "Generated $OutputPath"
}
