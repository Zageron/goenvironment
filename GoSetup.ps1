$downloadUrl = "https://dl.google.com/go/go1.9.3.windows-amd64.msi"
$installerFile = "go1.9.3.windows-amd64.msi"
$installerPath = (Join-Path $env:TEMP $installerFile)
$installerArguments = "/passive"

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
