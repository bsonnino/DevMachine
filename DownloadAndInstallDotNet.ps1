Set-ExecutionPolicy Bypass -Scope Process -Force;
$remoteFile = 'https://dot.net/v1/dotnet-install.ps1';
$downloadFile = 'dotnet-install.ps1';
$dotnetPath = $env:LOCALAPPDATA+"\Microsoft\Dotnet";

(New-Object Net.WebClient).DownloadFile($remoteFile, $downloadFile);
$env:Path += ";"+$dotnetPath
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User);
