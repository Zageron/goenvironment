# Install VSCode.
& ((Split-Path $MyInvocation.InvocationName) + "\VSCodeSetup.ps1")

# Install Go.
& ((Split-Path $MyInvocation.InvocationName) + "\GoSetup.ps1")

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Setup the Go environment.
& ((Split-Path $MyInvocation.InvocationName) + "\VSCGoSetup.ps1")

Write-Verbose "All done. Go to %USERPROFILE%\go to start!"