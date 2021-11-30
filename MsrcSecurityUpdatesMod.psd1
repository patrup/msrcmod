﻿#
# Module manifest for module 'MsrcSecurityUpdatesMod'
#
# Generated by: Microsoft Corporation
#
# Generated on: 3/6/2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'MsrcSecurityUpdatesMod.psm1'

# Version number of this module.
ModuleVersion = '1.9.5'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'edbaad75-2ab2-4394-83ef-80bc143d0502'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2017 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = @'
The Microsoft Security Response Center module gets Microsoft Security Update details
and CVRF (Common Vulnerability Reporting Format) documents in either JSON or XML.

This module calls the MSRC API (api.msrc.microsoft.com).

'@

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @(
    'Microsoft.IdentityModel.Clients.ActiveDirectory.dll'
    'Microsoft.IdentityModel.Clients.ActiveDirectory.WindowsForms.dll'
)

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
# FunctionsToExport = '*'
FunctionsToExport = @(
    'Get-KBDownloadUrlMod',
    'Get-MsrcCvrfAffectedSoftwareMod',
    'Get-MsrcCvrfCVESummaryMod',
    'Get-MsrcCvrfDocumentMod',
    'Get-MsrcCvrfExploitabilityIndexMod',
    'Get-MsrcSecurityBulletinHtmlMod',
    'Get-MsrcSecurityUpdateMod',
    'Get-MsrcVulnerabilityReportHtmlMod',
    'Set-MSRCAdalAccessTokenMod',
    'Set-MSRCApiKeyMod'
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
# CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
# AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('MSRC','Security', 'Updates','Microsoft', 'CVRF','PSEdition_Core','PSEdition_Desktop')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/Microsoft/MSRC-Microsoft-Security-Updates-API/blob/master/LICENSE.md'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Microsoft/MSRC-Microsoft-Security-Updates-API'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = @'
April 20, 2021 - Update API endpoint
April 7, 2021 - Adding FixedBuild to vulnerability report
March 2, 2021 - Fixing mitigation on vulnerability report 
February 19, 2021 - Updating Vulnerability Report HTML Style
February 3, 2021 - Removed Api-key requirement
January 17, 2021 - Added Issuing CNA info to Get-MsrcVulnerabilityReportHtmlMod
December 9, 2020 - Added Executive Summary to Get-MsrcVulnerabilityReportHtmlMod
November 23, 2020 - Added Known Issues to Get-MsrcVulnerabilityReportHtmlMod
October 23, 2020 - Replaced Description with CVSS table in Get-MsrcVulnerabilityReportHtmlMod
February 9, 2017 - Initial release to https://github.com/Microsoft/MSRC-Microsoft-Security-Updates-API
March 8, 2017 - Refactored into a script module and added basic Pester tests
March 14, 2017 - Added some error handling for when fields are not in the returned CVRF api reply
March 28, 2017 - Added Get-MsrcVulnerabilityReportHtmlMod
March 30, 2017 - PR from MVP (https://github.com/p0w3rsh3ll) Split module into public and private functions, etc
April 5, 2017 - Added ability to use Azure AD tokens, the module now supports calling the APIs with an API key or AAD token
April 18, 2017 - Small HTML change to Get-MsrcSecurityBulletinHtmlMod.ps1
April 28, 2017 - Bug fixes and some refactoring
May 3, 2017 - Added Proxy support, Updates to Get-MsrcVulnerabilityReportHtmlMod
May 5, 2017 - Further updates to Get-MsrcVulnerabilityReportHtmlMod
May 9, 2017 - Changed the string from "unknown" to "N/A" when a cvss score is null from the cvrf response
May 10, 2017 - fixed a typo that was causing FAQ to not display correctly
May 30, 2017 - Added tags to the table of contents, as well as changing the KB article text to be hyperlinked, and show the subtype if possible
May 31, 2017 - Removed padding between table of contents cells to reduce wasted space
June 2, 2017 - Added a fix to allow for multiline KB articles
June 19, 2017 - minor: fixed tests to not fail on Get-KBDownloadUrlMod. major: @rsola added a fix for early powershell versions not able to deserialize large json strings
'@

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
