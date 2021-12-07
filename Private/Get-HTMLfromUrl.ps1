$scriptpath = $PSScriptRoot -split "Private"
$libpath = $scriptpath[0] + "lib\Net45\HtmlAgilityPack.dll"

Add-Type -Path $libpath
Write-Host $libpath

function Get-HTMLfromUrl($url) {
   
    $web = New-Object HtmlAgilityPack.HtmlWeb

    $response = $web.LoadFromWebAsync($url)
    $improvements = $response.Result.DocumentNode.SelectNodes("//section[contains(@aria-label,'Improvements')]")
    $issues = $response.Result.DocumentNode.SelectNodes("//section[contains(@aria-label,'Issues')]")

    $kbarticle = [PSCustomObject]@{
        Improvements = $improvements;
        Issues       = $issues
    }

    return $kbarticle
}
