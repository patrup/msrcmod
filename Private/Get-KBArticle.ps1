Add-Type -Path .\lib\NetCore45\HtmlAgilityPack.dll
function Get-KBArticle {
    Param (
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]$kbarticleurl
    )
    $doc = New-Object HtmlAgilityPack.HtmlWeb
    $Response = $doc.LoadFromWebAsync($kbarticleurl)
    Return $Response.Result.DocumentNode.XPath
}



