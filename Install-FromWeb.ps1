[CmdletBinding()]
Param (
  $remoteFile,
  $downloadFile,
  [bool]$extractFile,
  $addedPath
)

(New-Object Net.WebClient).DownloadFile($remoteFile, $downloadFile);
If ($extractFile){
  Expand-Archive $downloadFile -DestinationPath $addedPath -Force
}
$env:Path += ";"+$addedPath
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User);
