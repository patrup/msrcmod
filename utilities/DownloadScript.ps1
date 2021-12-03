$srv = "https://raw.githubusercontent.com/patrup/msrcmod/main"
$files = Get-Content .\utilities\Files.txt
$files | ForEach-Object {if ($_){(Invoke-WebRequest -Uri ($srv + $_)).Content | ForEach-Object {$_.Replace("`/","\")} | Out-File ("."+$_) }}