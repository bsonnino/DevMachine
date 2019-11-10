[CmdletBinding()]
Param (
  $RemoteFile,
  $DownloadFile,
  [bool]$DoExtractFile = $False,
  [string]$ExecutePath = $null,
  $AddedPath
)

(New-Object Net.WebClient).DownloadFile($remoteFile, $downloadFile);
If ($DoExtractFile){
  Expand-Archive $DownloadFile -DestinationPath $AddedPath -Force
}
If (-Not ([string]::IsNullOrEmpty($ExecutePath))){
  & "$ExecutePath"
}  
$env:Path += ";"+$AddedPath
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User);
