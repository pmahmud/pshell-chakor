Write-Host "----------------------------------------------"
Write-Host "| pshell-chakor                               |"
Write-Host "----------------------------------------------"
Write-Host "  Trying to install pshell-chakor module at:"

$nl = [Environment]::NewLine

$srcLocation = 'C:\git\pshell-chakor\pshell-chakor\*'
$destLocation = "$home\Documents\WindowsPowerShell\Modules\pshell-chakor"
Write-Host "  $destLocation"
mkdir $destLocation -ErrorAction SilentlyContinue
Copy-Item $srcLocation $destLocation

Write-Host "$nl  Copied all the installation files to module folder." -ForegroundColor Green
Write-Host "  Trying to run the module from:"

Write-Host "  $destLocation\pshell-chakor.ps1"

. "$destLocation\pshell-chakor.ps1"
testInstallChakor

