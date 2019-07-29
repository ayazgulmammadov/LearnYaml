param(
    [string] $webConfigPath,
    [string] $connectionString
)
$webConfig = [xml](Get-Content -Path $webConfigPath)
$webConfig.SelectNodes("//connectionStrings").add.connectionString = "$connectionString"
$webConfig.Save($webConfigPath)