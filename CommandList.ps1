Set-ExecutionPolicy Bypass -Scope Process -Force;
.\Install-FromWeb.ps1 -RemoteFile "https://go.microsoft.com/fwlink/?Linkid=850641" -DownloadFile $env:Temp"\vscode.zip" -DoExtractFile $true -AddedPath $env:LOCALAPPDATA"\VsCode"
.\Install-FromWeb.ps1 -RemoteFile 'https://nodejs.org/dist/v12.13.0/node-v12.13.0-win-x64.zip' -DownloadFile $env:Temp'\node-v12.13.0-win-x64.zip' -DoExtractFile $true -AddedPath $env:LOCALAPPDATA"\Node"
Move-Item -Path $env:LOCALAPPDATA"\Node\node-v12.13.0-win-x64" -Destination $env:LOCALAPPDATA"\Node1"
Remove-item -Path $env:LOCALAPPDATA"\Node"
Rename-item -Path $env:LOCALAPPDATA"\Node1" -NewName $env:LOCALAPPDATA"\Node"
npm install yarn -g
.\Install-FromWeb.ps1 -RemoteFile 'https://dot.net/v1/dotnet-install.ps1' -DownloadFile $env:Temp'\dotnet-install.ps1' -DoExtractFile $false -AddedPath $env:LOCALAPPDATA'\Microsoft\Dotnet' -ExecutePath $env:Temp'\dotnet-install.ps1'
.\Install-FromWeb.ps1 -RemoteFile 'https://github.com/git-for-windows/git/releases/download/v2.24.0.windows.2/PortableGit-2.24.0.2-64-bit.7z.exe' -DownloadFile $env:TEMP'\PortableGit.exe' -DoExtractFile $false -AddedPath $env:LOCALAPPDATA'\Git\bin' -Debug
& $env:TEMP'\PortableGit.exe' -o $env:LOCALAPPDATA'\Git' -y 
