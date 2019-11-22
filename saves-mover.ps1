# Config
$strConfigFile = Join-Path -Path $home -ChildPath saves-mover.psd1
try {
$ConfigFile = Import-PowerShellDataFile $strConfigFile 
} catch <#[FileNotFound]#> {
New-Config
$ConfigFile = Import-PowerShellDataFile $strConfigFile 
} finally {
$pathYandexDiskWesnothSaves = $ConfigFile.pathYandexDiskWesnothSaves
$pathWesnothSaves = $ConfigFile.pathWesnothSaves
}

function Copy-Saves () {
Copy-Item -Path $pathYandexDiskWesnothSaves -Destination $pathWesnothSaves
}