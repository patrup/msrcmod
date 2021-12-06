$exclude = @("loadAllFunctions.ps1","MsrcSecurityUpdates.testsMod.ps1")

Get-ChildItem -Recurse -Path '*.ps1' -Exclude $exclude | Resolve-Path -Relative | Where-Object {$_ -notlike "*utilities*"} | ForEach-Object {& $_}