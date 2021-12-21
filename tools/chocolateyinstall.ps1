
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/open-telemetry/opentelemetry-collector-contrib/releases/download/v0.38.0/otel-contrib-collector-0.38.0-amd64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url64bit      = $url64

  softwareName  = 'opentelemetry-collector-contrib*'

  checksum64    = 'ddffeade4705325b3282fd71c518fb047bd55d77a45ea32823862df6a1edd8bb'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs



















