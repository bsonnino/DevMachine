[CmdletBinding()]
Param (
  $RemoteFile,
  $DownloadFile,
  [bool]$DoExtractFile = $False,
  [string]$ExecutePath = $null,
  $AddedPath
)
Write-Host $RemoteFile
Write-Host $DownloadFile

Invoke-WebRequest -Uri $RemoteFile -OutFile $DownloadFile
If ($DoExtractFile){
  Expand-Archive $DownloadFile -DestinationPath $AddedPath -Force
}
If (-Not ([string]::IsNullOrEmpty($ExecutePath))){
  & "$ExecutePath"
}  
$env:Path += ";"+$AddedPath
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User);
