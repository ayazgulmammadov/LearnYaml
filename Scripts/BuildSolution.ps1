[CmdletBinding()]
Param(
    [string] $Solution,
	[string] $ToolsDir,
    [string] $destFolder
)
Write-Host "Restore nuget..."
& ("{0}{1}" -f $ToolsDir, "\NuGet\4.4.1\x64\nuget.exe") restore $Solution

$ms = (Get-ItemProperty -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\VisualStudio\SxS\VS7\).'15.0'
$MSBuildPath = ("{0}{1}" -f $ms, 'MSBuild\15.0\Bin\MSBuild.exe')

Write-Host "Start build solution..."
& $MSBuildPath $Solution "/p:DeployOnBuild=true;Configuration=Release;DeployDefaultTarget=WebPublish;WebPublishMethod=FileSystem;SkipInvalidConfigurations=true;publishUrl=$destFolder"

