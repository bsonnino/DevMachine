Set-ExecutionPolicy Bypass -Scope Process -Force;
$remoteFile = 'https://nodejs.org/dist/v12.13.0/node-v12.13.0-win-x64.zip';
$downloadFile = $env:Temp+'\node-v12.13.0-win-x64.zip';
$nodePath = $env:LOCALAPPDATA+"\Node";

(New-Object Net.WebClient).DownloadFile($remoteFile, $downloadFile);
Expand-Archive $downloadFile -DestinationPath $nodePath -Force
$env:Path += ";"+$nodePath
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User);