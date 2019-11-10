Set-ExecutionPolicy Bypass -Scope Process -Force;
$remoteFile = 'https://go.microsoft.com/fwlink/?Linkid=850641';
$downloadFile = $env:Temp+'\vscode.zip';
$vscodePath = $env:LOCALAPPDATA+"\VsCode";

(New-Object Net.WebClient).DownloadFile($remoteFile, $downloadFile);
Expand-Archive $downloadFile -DestinationPath $vscodePath -Force
$env:Path += ";"+$vscodePath
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User);
