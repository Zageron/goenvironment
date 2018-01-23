$downloadUrl = "https://go.microsoft.com/fwlink/?Linkid=852157"
$installerFile = "vscode-install.exe"
$installerPath = (Join-Path $env:TEMP $installerFile)
$installerArguments = "/silent /mergetasks='!runcode,addtopath'"

function GetProxyEnabledWebClient
{
    $wc = New-Object System.Net.WebClient
    $proxy = [System.Net.WebRequest]::GetSystemWebProxy()
    $proxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials        
    $wc.Proxy = $proxy
    return $wc
}

Write-Verbose "Downloading $installerFile..."
$wc = GetProxyEnabledWebClient
$wc.DownloadFile($downloadUrl, $installerPath)

Write-Verbose "Installing $installerPath..."
Start-Process $installerPath -ArgumentList $installerArguments -Wait

Write-Verbose "Cleanup the downloaded file."
Remove-Item $installerPath -Force
