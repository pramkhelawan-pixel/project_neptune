<#
===============================================================================
 Project Neptune
 Engineering Intelligence System

 File:        engineering_index.ps1
 Version:     1.0.0
 Description: Entry point for the Neptune Engineering Intelligence System.
===============================================================================
#>

$ErrorActionPreference = "Stop"

Clear-Host

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "        NEPTUNE ENGINEERING INTELLIGENCE SYSTEM v1.0.0       " -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# -----------------------------------------------------------------------------
# Load Configuration
# -----------------------------------------------------------------------------

$configFile = Join-Path $PSScriptRoot "config\engineering_config.ps1"

if (!(Test-Path $configFile)) {
    Write-Host "[ERROR] Configuration file not found." -ForegroundColor Red
    Write-Host $configFile
    exit 1
}

. $configFile

Write-Host "[PASS] Configuration loaded." -ForegroundColor Green

# -----------------------------------------------------------------------------
# Validate Repository
# -----------------------------------------------------------------------------

$root = $EngineeringConfig.RepositoryRoot

if (!(Test-Path $root)) {
    Write-Host "[ERROR] Repository root not found." -ForegroundColor Red
    exit 1
}

Write-Host "[PASS] Repository located." -ForegroundColor Green

# -----------------------------------------------------------------------------
# Ensure Output Folder Exists
# -----------------------------------------------------------------------------

$outputFolder = Join-Path $root $EngineeringConfig.EngineeringFolder

if (!(Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

# -----------------------------------------------------------------------------
# Collect Basic Statistics
# -----------------------------------------------------------------------------

Write-Host ""
Write-Host "Collecting repository statistics..." -ForegroundColor Yellow

$dartFiles =
(Get-ChildItem "$root\$($EngineeringConfig.SourceFolder)" -Recurse -Filter *.dart -ErrorAction SilentlyContinue).Count

$markdownFiles =
(Get-ChildItem $root -Recurse -Filter *.md -ErrorAction SilentlyContinue).Count

$powershellFiles =
(Get-ChildItem $root -Recurse -Filter *.ps1 -ErrorAction SilentlyContinue).Count

$engineeringObject = [ordered]@{

    project = $EngineeringConfig.ProjectName

    version = "1.0.0"

    generated = Get-Date

    statistics = [ordered]@{

        dartFiles = $dartFiles

        markdownFiles = $markdownFiles

        powershellFiles = $powershellFiles
    }

}

# -----------------------------------------------------------------------------
# Generate JSON
# -----------------------------------------------------------------------------

$jsonFile = Join-Path $root $EngineeringConfig.OutputJson

$engineeringObject |
ConvertTo-Json -Depth 10 |
Out-File $jsonFile -Encoding UTF8

Write-Host "[PASS] engineering_index.json created." -ForegroundColor Green

# -----------------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------------

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host " Engineering Intelligence completed successfully." -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""

Write-Host "Repository :" $root
Write-Host "Dart Files :" $dartFiles
Write-Host "Markdown   :" $markdownFiles
Write-Host "PowerShell :" $powershellFiles
Write-Host ""

Write-Host "Output"
Write-Host $jsonFile
Write-Host ""