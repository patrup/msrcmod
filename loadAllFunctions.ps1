$exclude = @(".vscode","utilities","Private","Public","loadAllFunctions.ps1")

get-childitem .\.vscode | Resolve-Path -Relative | ForEach-Object {$exclude += $_}
get-childitem .\utilities | Resolve-Path -Relative | ForEach-Object { $_.Substring(2)} |  ForEach-Object {$exclude += $_}

Get-ChildItem -Recurse -Exclude $exclude | Resolve-Path -Relative | Where-Object { $_ -like "*.ps1"} | ForEach-Object {& $_}

# & {.\Private\ParseJsonString.ps1}||$ScriptRoute = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, "Scriptname.ps1"))