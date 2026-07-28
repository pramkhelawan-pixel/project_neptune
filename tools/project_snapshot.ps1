<#
===============================================================================
 Project Neptune
 Developer Toolkit

 File:        tools/project_snapshot.ps1
 Version:     2.0
 Description: Generates a complete engineering snapshot of the Neptune project.
===============================================================================
#>

$ErrorActionPreference = "Continue"

Clear-Host

Write-Host ""
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "              PROJECT NEPTUNE SNAPSHOT v2.0             " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$SnapshotFolder = "docs\project_snapshot"

if (!(Test-Path $SnapshotFolder)) {
    New-Item -ItemType Directory -Path $SnapshotFolder | Out-Null
}

# -----------------------------------------------------------------------------
# Project Tree
# -----------------------------------------------------------------------------

Write-Host "[1/12] Generating project tree..." -ForegroundColor Yellow

cmd /c "tree /F /A > `"$SnapshotFolder\01_project_tree.txt`""

# -----------------------------------------------------------------------------
# Flutter Analyze
# -----------------------------------------------------------------------------

Write-Host "[2/12] Running flutter analyze..." -ForegroundColor Yellow

flutter analyze *> "$SnapshotFolder\02_flutter_analyze.txt"

# -----------------------------------------------------------------------------
# Dependencies
# -----------------------------------------------------------------------------

Write-Host "[3/12] Exporting package dependencies..." -ForegroundColor Yellow

flutter pub deps *> "$SnapshotFolder\03_pub_dependencies.txt"

# -----------------------------------------------------------------------------
# Dart Files
# -----------------------------------------------------------------------------

Write-Host "[4/12] Indexing Dart files..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Sort-Object FullName |
Select-Object FullName |
Out-File "$SnapshotFolder\04_dart_files.txt"

# -----------------------------------------------------------------------------
# Riverpod Providers
# -----------------------------------------------------------------------------

Write-Host "[5/12] Discovering providers..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Select-String "@riverpod|Provider<|FutureProvider|StreamProvider|NotifierProvider|AsyncNotifierProvider" |
Select Path,LineNumber,Line |
Out-File "$SnapshotFolder\05_providers.txt"

# -----------------------------------------------------------------------------
# Repositories
# -----------------------------------------------------------------------------

Write-Host "[6/12] Discovering repositories..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Select-String "Repository" |
Select Path,LineNumber,Line |
Out-File "$SnapshotFolder\06_repositories.txt"

# -----------------------------------------------------------------------------
# Services
# -----------------------------------------------------------------------------

Write-Host "[7/12] Discovering services..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Select-String "Service" |
Select Path,LineNumber,Line |
Out-File "$SnapshotFolder\07_services.txt"

# -----------------------------------------------------------------------------
# Models
# -----------------------------------------------------------------------------

Write-Host "[8/12] Discovering models..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Select-String "class " |
Select Path,LineNumber,Line |
Out-File "$SnapshotFolder\08_models.txt"

# -----------------------------------------------------------------------------
# Widgets
# -----------------------------------------------------------------------------

Write-Host "[9/12] Discovering widgets..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Select-String "extends StatelessWidget|extends ConsumerWidget|extends StatefulWidget|extends ConsumerStatefulWidget" |
Select Path,LineNumber,Line |
Out-File "$SnapshotFolder\09_widgets.txt"

# -----------------------------------------------------------------------------
# Routes
# -----------------------------------------------------------------------------

Write-Host "[10/12] Discovering routes..." -ForegroundColor Yellow

Get-ChildItem -Recurse -Filter *.dart |
Select-String "GoRoute|ShellRoute|TypedGoRoute|context.go|context.push|context.replace" |
Select Path,LineNumber,Line |
Out-File "$SnapshotFolder\10_routes.txt"

# -----------------------------------------------------------------------------
# Git Information
# -----------------------------------------------------------------------------

Write-Host "[11/12] Collecting Git information..." -ForegroundColor Yellow

if (Test-Path ".git") {

    git status > "$SnapshotFolder\11_git_status.txt"

    git log --graph --decorate --oneline -30 > "$SnapshotFolder\12_git_log.txt"

}

# -----------------------------------------------------------------------------
# Statistics
# -----------------------------------------------------------------------------

Write-Host "[12/12] Building statistics..." -ForegroundColor Yellow

$dartFiles = (Get-ChildItem -Recurse -Filter *.dart).Count

$providerCount =
(
Get-ChildItem -Recurse -Filter *.dart |
Select-String "@riverpod|Provider<|FutureProvider|StreamProvider|NotifierProvider|AsyncNotifierProvider"
).Count

$repositoryCount =
(
Get-ChildItem -Recurse -Filter *.dart |
Select-String "Repository"
).Count

$serviceCount =
(
Get-ChildItem -Recurse -Filter *.dart |
Select-String "Service"
).Count

$modelCount =
(
Get-ChildItem -Recurse -Filter *.dart |
Select-String "class "
).Count

$widgetCount =
(
Get-ChildItem -Recurse -Filter *.dart |
Select-String "extends StatelessWidget|extends ConsumerWidget|extends StatefulWidget|extends ConsumerStatefulWidget"
).Count

$routeCount =
(
Get-ChildItem -Recurse -Filter *.dart |
Select-String "GoRoute|ShellRoute|TypedGoRoute"
).Count

$flutterVersion = flutter --version | Select-Object -First 1

@"
========================================================
              PROJECT NEPTUNE ENGINEERING REPORT
========================================================

Generated:
$(Get-Date)

Flutter
--------
$flutterVersion

Statistics
----------
Dart Files      : $dartFiles
Providers       : $providerCount
Repositories    : $repositoryCount
Services        : $serviceCount
Models          : $modelCount
Widgets         : $widgetCount
Routes          : $routeCount

Snapshot Folder
---------------
$SnapshotFolder

========================================================
"@ | Out-File "$SnapshotFolder\13_statistics.txt"

Write-Host ""
Write-Host "========================================================" -ForegroundColor Green
Write-Host " Snapshot completed successfully." -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Output Folder:" -ForegroundColor Cyan
Write-Host "$SnapshotFolder" -ForegroundColor White
Write-Host ""