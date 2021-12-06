$scriptroot = "$PSScriptRoot\.."
Add-Type -Path "$scriptroot\lib\Net45\HtmlAgilityPack.dll"

function Get-HTMLfromUrl{
    Param (
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]$url
    )

    $web = New-Object HtmlAgilityPack.HtmlWeb

$response = $web.LoadFromWebAsync($url)
$improvements = $response.Result.DocumentNode.SelectNodes("//section[contains(@aria-label,'Improvements')]")
$issues = $response.Result.DocumentNode.SelectNodes("//section[contains(@aria-label,'Issues')]")

$kbarticle = [PSCustomObject]@{
    Improvements = $improvements;
    Issues = $issues
}

return $kbarticle
}
