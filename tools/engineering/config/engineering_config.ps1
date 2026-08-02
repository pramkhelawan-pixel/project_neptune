<#
===============================================================================
 Project Neptune
 Engineering Intelligence System

 File:        engineering_config.ps1
 Version:     1.0
 Purpose:     Central configuration for the Engineering Intelligence System.
===============================================================================
#>

# -----------------------------------------------------------------------------
# Project Information
# -----------------------------------------------------------------------------

$Global:EngineeringConfig = @{

    ProjectName = "Project Neptune"

    Version = "1.0"

    RepositoryRoot = (Resolve-Path "$PSScriptRoot\..\..\..").Path

    DocsFolder = "docs"

    EngineeringFolder = "docs\engineering"

    SnapshotFolder = "docs\project_snapshot"

    StandardsFolder = "docs\standards"

    ArchitectureFolder = "docs\architecture"

    SourceFolder = "lib"

    TestFolder = "test"

    ToolsFolder = "tools"

    OutputJson = "docs\engineering\engineering_index.json"

    OutputHealth = "docs\engineering\engineering_health.md"

}