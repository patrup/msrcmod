Function Get-KBDownloadUrlMod {
<#
    .SYNOPSIS
        Takes the kb output from Get-MsrcCvrfAffectedSoftwareMod and builds the html to insert into a document.

    .DESCRIPTION
        Takes the kb output from Get-MsrcCvrfAffectedSoftwareMod and builds the html to insert into a document.

    .PARAMETER KBArticleObject
        The KB Article object that contains the id, url, and subtype.

    .EXAMPLE
        [PSCustomObject]@{ID="kb123456"; URL="microsoft.com"; SubType="Required"} | Get-KBDownloadUrlMod
#>
[CmdletBinding()]
[OutputType([System.String])]
Param (
    [Parameter(Mandatory,ValueFromPipeline)]
    [PSCustomObject]$KBArticleObject
)
Begin {
    $HTML_TO_RETURN = @()
}
Process {
    if (-not($KBArticleObject)){
        'None'
    } else {

        $KBArticleObject |
        ForEach-Object {
            $kb = $_
            #In older months, there won't be a subtype. Handle this so there are not empty ()'s
            if ($kb.ID -like "*Release Notes*") {
                $HTML_TO_RETURN += $('<a href="{0}" target="_blank">{1} ({2})' -f $kb.Url, $kb.ID, $kb.SubType)
            }
            else {
                if($kb.SubType){
                    $HTML_TO_RETURN += $('<a href="https://support.microsoft.com/help/{0}" target="_blank">{0} ({1})' -f $kb.ID, $kb.SubType)
                } else {
                    $HTML_TO_RETURN += $('<a href="https://support.microsoft.com/help/{0}" target="_blank">{0}' -f $kb.ID)
                }
            }
        }
    }
}
End {
    $HTML_TO_RETURN -join '<br />'
}
}