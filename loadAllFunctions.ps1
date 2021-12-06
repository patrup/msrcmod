$exclude = @("loadAllFunctions.ps1","MsrcSecurityUpdates.testsMod.ps1")

# get-childitem .\utilities | Select-Object -ExpandProperty FullName | ForEach-Object {$exclude += $_.ToString()}

Get-ChildItem -Recurse -Path '*.ps1' -Exclude $exclude | Select-Object -ExpandProperty FullName | Where-Object {$_ -notlike "*utilities*"} | ForEach-Object {& $_}

# & {.\Private\ParseJsonString.ps1}||$ScriptRoute = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, "Scriptname.ps1"))