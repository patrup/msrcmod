
# Import module would only work if the module is found in standard locations
# Import-Module -Name MsrcSecurityUpdatesMod -Force
Import-Module (Join-Path -Path $PSScriptRoot -ChildPath 'MsrcSecurityUpdatesMod.psd1') -Verbose -Force

<#
Get-Help Get-MsrcSecurityUpdateMod
Get-Help Get-MsrcSecurityUpdateMod -Examples

Get-Help Get-MsrcCvrfDocumentMod
Get-Help Get-MsrcCvrfDocumentMod -Examples

Get-Help Get-MsrcSecurityBulletinHtmlMod
Get-Help Get-MsrcSecurityBulletinHtmlMod -Examples

Get-Help Get-MsrcCvrfAffectedSoftwareMod
Get-Help Get-MsrcCvrfAffectedSoftwareMod -Examples
#>

Describe 'Function: Get-MsrcSecurityUpdateModMSRC (calls the /Updates API)' {

    It 'Get-MsrcSecurityUpdateMod - all' {
        Get-MsrcSecurityUpdateMod |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcSecurityUpdateMod - by year' {
        Get-MsrcSecurityUpdateMod -Year 2017 |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcSecurityUpdateMod - by vulnerability' {
        Get-MsrcSecurityUpdateMod -Vulnerability CVE-2017-0003 |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcSecurityUpdateMod - by cvrf' {
        Get-MsrcSecurityUpdateMod -Cvrf 2017-Jan |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcSecurityUpdateMod - by date - before' {
        Get-MsrcSecurityUpdateMod -Before 2018-01-01 |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcSecurityUpdateMod - by date - after' {
        Get-MsrcSecurityUpdateMod -After 2017-01-01 |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcSecurityUpdateMod - by date - before and after' {
        Get-MsrcSecurityUpdateMod -Before 2018-01-01 -After 2017-10-01 |
        Should Not BeNullOrEmpty
    }
}

Describe 'Function: Get-MsrcCvrfDocumentMod (calls the MSRC /cvrf API)' {

    It 'Get-MsrcCvrfDocumentMod - 2016-Nov' {
        Get-MsrcCvrfDocumentMod -ID 2016-Nov |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcCvrfDocumentMod - 2016-Nov - as XML' {
        Get-MsrcCvrfDocumentMod -ID 2016-Nov -AsXml |
        Should Not BeNullOrEmpty
    }

    Get-MsrcSecurityUpdateMod | Where-Object { $_.ID -ne '2017-May-B' } |
    Foreach-Object {
        It "Get-MsrcCvrfDocumentMod - none shall throw: $($PSItem.ID)" {
            {
                $null = Get-MsrcCvrfDocumentMod -ID $PSItem.ID
            } |
            Should Not Throw
        }
    }

    It 'Get-MsrcCvrfDocumentMod for 2017-May-B with Get-MsrcCvrfDocumentMod should throw' {
        {
            Get-MsrcSecurityUpdateMod | Where-Object { $_.ID -eq '2017-May-B' } |
            Foreach-Object {
                $null = Get-MsrcCvrfDocumentMod -ID $PSItem.ID
            }
        } | Should Throw
    }
}

Describe 'Function: Set-MSRCApiKeyMod with proxy' {
    if (-not ($global:msrcProxy)) {

       Write-Warning -Message 'This test requires you to use Set-MSRCApiKeyMod first to set your API Key and proxy details'
       break
    }

    It 'Get-MsrcSecurityUpdateMod - all' {
        Get-MsrcSecurityUpdateMod |
        Should Not BeNullOrEmpty
    }

    It 'Get-MsrcCvrfDocumentMod - 2016-Nov' {
        Get-MsrcCvrfDocumentMod -ID 2016-Nov |
        Should Not BeNullOrEmpty
    }
}

# May still work but not ready yet...
# Describe 'Function: Get-MsrcSecurityBulletinHtmlMod (generates the MSRC Security Bulletin HTML Report)' {
#     It 'Security Bulletin Report' {
#         Get-MsrcCvrfDocumentMod -ID 2016-Nov |
#         Get-MsrcSecurityBulletinHtmlMod |
#         Should Not BeNullOrEmpty
#     }
# }
InModuleScope MsrcSecurityUpdatesMod {
    Describe 'Function: Get-MsrcCvrfAffectedSoftwareMod' {
        It 'Get-MsrcCvrfAffectedSoftwareMod by pipeline' {
            Get-MsrcCvrfDocumentMod -ID 2016-Nov |
            Get-MsrcCvrfAffectedSoftwareMod |
            Should Not BeNullOrEmpty
        }

        It 'Get-MsrcCvrfAffectedSoftwareMod by parameters' {
            $cvrfDocument = Get-MsrcCvrfDocumentMod -ID 2016-Nov
            Get-MsrcCvrfAffectedSoftwareMod -Vulnerability $cvrfDocument.Vulnerability -ProductTree $cvrfDocument.ProductTree |
            Should Not BeNullOrEmpty
        }
    }

    Describe 'Function: Get-MsrcCvrfProductVulnerability' {
        It 'Get-MsrcCvrfProductVulnerability by pipeline' {
            Get-MsrcCvrfDocumentMod -ID 2016-Nov |
            Get-MsrcCvrfProductVulnerability |
            Should Not BeNullOrEmpty
        }

        It 'Get-MsrcCvrfProductVulnerability by parameters' {
            $cvrfDocument = Get-MsrcCvrfDocumentMod -ID 2016-Nov
            Get-MsrcCvrfProductVulnerability -Vulnerability $cvrfDocument.Vulnerability -ProductTree $cvrfDocument.ProductTree -DocumentTracking $cvrfDocument.DocumentTracking -DocumentTitle $cvrfDocument.DocumentTitle  |
            Should Not BeNullOrEmpty
        }
    }
}

Describe 'Function: Get-MsrcVulnerabilityReportHtmlMod (generates the MSRC Vulnerability Summary HTML Report)' {
    It 'Vulnerability Summary Report - does not throw' {
        {
            $null = Get-MsrcCvrfDocumentMod -ID 2016-Nov |
            Get-MsrcVulnerabilityReportHtmlMod -Verbose -ShowNoProgress
        } |
        Should Not Throw
    }

    Get-MsrcSecurityUpdateMod | Where-Object { $_.ID -ne '2017-May-B' } |
    Foreach-Object {
        It "Vulnerability Summary Report - none shall throw: $($PSItem.ID)" {
            {
                $null = Get-MsrcCvrfDocumentMod -ID $PSItem.ID |
                Get-MsrcVulnerabilityReportHtmlMod -ShowNoProgress
            } |
            Should Not Throw
        }
    }
}

InModuleScope MsrcSecurityUpdatesMod {
	Describe 'Function: Get-KBDownloadUrlMod (generates the html for KBArticle downloads used in the vulnerability report affected software table)' {
		It 'Get-KBDownloadUrlMod by pipeline' {
			{
				$doc = Get-MsrcCvrfDocumentMod -ID 2017-May
				$af = $doc | Get-MsrcCvrfAffectedSoftwareMod
				$af.KBArticle | Get-KBDownloadUrlMod
			} |
			Should Not Throw
		}


		It 'Get-KBDownloadUrlMod by parameters' {
			{
				$doc = Get-MsrcCvrfDocumentMod -ID 2017-May
				$af = $doc | Get-MsrcCvrfAffectedSoftwareMod
				Get-KBDownloadUrlMod -KBArticleObject $af.KBArticle
			} |
			Should Not Throw
		}
	}
}

#When a pester test fails, it writes out to stdout, and sets an error in $Error. When invoking powershell from C# it is a lot easier to read the stderr stream.
if($Error)
{
    Write-Error -Message 'A pester test has failed during the validation process'
}
