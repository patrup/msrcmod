$exclude = @(".vscode","utilities","Private","Public")
get-childitem .\.vscode | ForEach-Object {$exclude += $_}
get-childitem .\utilities | ForEach-Object {$exclude += $_}

Get-ChildItem -Recurse -Exclude $exclude | Resolve-Path -relative | ForEach-Object {$_.Replace("`\","`/").Substring(1)} | Out-File .\utilities\Files.txt
