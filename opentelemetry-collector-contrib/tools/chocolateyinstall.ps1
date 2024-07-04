
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.104.0/otelcol-contrib_0.104.0_windows_x86.msi'
$checksum   = '55913d6eda207452e40152d2492c562d4effe1a7e6b8c785a978c828d8682b59'
$url64      = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.104.0/otelcol-contrib_0.104.0_windows_x64.msi'
$checksum64 = '8849584aabda1e60539111e73326853a96f2f876cfcec49986adcedaf44dac45'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'opentelemetry-collector-contrib*'

  checksum      = $checksum
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = $checksum64
  checksumType64= 'sha256' #default is checksumType

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

















