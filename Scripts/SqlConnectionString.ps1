param(
    [string] $webConfigPath,
    [string] $SqlServerName,
    [string] $dbName,
    [string] $sqlUser,
    [string] $sqlPassword
)
$connectionString = "Server=tcp:$SqlServerName,1433;Initial Catalog=$dbName;Persist Security Info=False;User ID=$sqlUser;Password=$sqlPassword;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
$webConfig = [xml](Get-Content -Path $webConfigPath)
$webConfig.SelectNodes("//connectionStrings").add.connectionString = $connectionString
$webConfig.Save($webConfigPath)