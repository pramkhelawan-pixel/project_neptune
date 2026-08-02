<#
===============================================================================
 Project Neptune
 Engineering Intelligence System

 File:        repository_scanner.ps1
 Version:     1.0.0
 Description: Discovers repository features and basic statistics.
===============================================================================
#>

function Invoke-RepositoryScanner {

    param(
        [Parameter(Mandatory)]
        [hashtable]$Config
    )

    $repositoryRoot = $Config.RepositoryRoot
    $featuresRoot = Join-Path $repositoryRoot "lib\features"

    $features = @()

    if (!(Test-Path $featuresRoot)) {
        throw "Features folder not found: $featuresRoot"
    }

    Get-ChildItem $featuresRoot -Directory |
    Sort-Object Name |
    ForEach-Object {

        $featureFolder = $_

        $dartFiles = (
            Get-ChildItem $featureFolder.FullName `
                -Recurse `
                -Filter *.dart `
                -ErrorAction SilentlyContinue
        ).Count

        $features += [ordered]@{
            name = $featureFolder.Name
            path = $featureFolder.FullName.Replace($repositoryRoot, "")
            dartFiles = $dartFiles
        }
    }

    return [ordered]@{
        featureCount = $features.Count
        features = $features
    }
}