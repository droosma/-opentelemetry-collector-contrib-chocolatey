Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"           
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"      
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"      
        }
    }
}

function global:au_GetLatest {
    $release = Invoke-RestMethod https://api.github.com/repos/open-telemetry/opentelemetry-collector-releases/releases/latest
    $asset32 = $release.assets | 
        Where-Object { $_.name -like 'otelcol-contrib*windows_x86.msi' } | 
        Select-Object -First 1

    $asset64 = $release.assets | 
        Where-Object { $_.name -like 'otelcol-contrib*windows_x64.msi' } | 
        Select-Object -First 1

    $release.name -match "v(.*)"
    $version = $Matches[1]
    
    @{ Version = $version; URL32 = $asset32.browser_download_url; URL64 = $asset64.browser_download_url }
}

update
