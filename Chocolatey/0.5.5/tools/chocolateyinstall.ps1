$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/yourtablecloth/TableCloth/releases/download/v0.5.5/TableCloth_0.5.5_Setup.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'TableCloth*'

  # Checksum Calculation: $(Get-FileHash -Path 'MSI File Path' -Algorithm SHA256).Hash
  checksum      = '135273BC610735D12376D26DC2BA294D4BA6480ABF35F25F86A865EBA269809C'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
