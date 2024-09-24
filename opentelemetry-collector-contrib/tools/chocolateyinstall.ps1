
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_windows_x86.msi'
$checksum   = '94e410e7bb17e1dcd9d7b78fae08059bc04aac2fc94fd87f6a860ffb8a8cbe09'
$url64      = 'https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.109.0/otelcol-contrib_0.109.0_windows_x64.msi'
$checksum64 = 'ba686ea103f5c7cb940af641e1b28b3260d52a4b0fb954aa217bc10d1fdac9f0'

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

















