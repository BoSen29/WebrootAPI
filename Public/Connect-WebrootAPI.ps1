function Connect-WebrootAPI {
    [CmdletBinding(DefaultParameterSetName = "Standard")]
    param (
        # Credential to Webroot
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ParameterSetName = "Standard"
        )]
        [PSCredential]
        $Credential,
        # API Credential
        [Parameter(
            Mandatory = $true,
            Position = 1,
            ParameterSetName = "Standard"
        )]
        [pscredential]
        $APISecrets,
        # Quiet switch to refresh tokens
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "Refresh"
        )]
        [switch]
        $Refresh
    )
    Begin {
        if ($PSCmdlet.ParameterSetName -eq "Refresh") {
            if ((Get-WRVariable -name "WRRefresh") -and (Get-WRVariable -name "WRAPISecrets") -and (Get-WRVariable -name "WRCredential")) {
                if ((Get-WRVariable -name "WRTokenTimeout") -lt (Get-Date).Addseconds(-1)) {
                    write-verbose "Attempting to refresh the token with the cached credentials. Token outdated."
                    $APISecrets = Get-WRVariable -name "WRAPISecrets"
                    $Credential = Get-WRVariable -name "WRCredential"
                    $Params = @{
                        Headers = @{
                            'Accept'        = 'application/json'
                            'Content-Type'  = 'application/x-www-form-urlencoded'
                            'Authorization' = 'Basic {0}' -f [convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($APISecrets.UserName + ':' + $APISecrets.GetNetworkCredential().Password))
                        }
                        Body = @{
                            username = $Credential.UserName
                            password = $Credential.GetNetworkCredential().Password
                            grant_type = "password"
                            'scope' = '*'
                        }
                        URI         = "https://unityapi.webrootcloudav.com/auth/token"
                        Method      = 'POST'
                    }
                }
                else {
                    #The refresh token is not expired
                    write-verbose "Refresh token still valid, attempting to refresh."
                    $APISecrets = Get-WRVariable -name "WRAPISecrets"
                    $Params = @{
                        Headers = @{
                            'Accept'        = 'application/json'
                            'Content-Type'  = 'application/x-www-form-urlencoded'
                            'Authorization' = 'Basic {0}' -f [convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($APISecrets.UserName + ':' + $APISecrets.GetNetworkCredential().Password))
                        }
                        Body = @{
                            'refresh_token' = ((Get-WRVariable -name "WRRefresh").refresh_token )
                            'grant_type' = "refresh_token"
                            'scope' = '*'
                        }
                        URI         = "https://unityapi.webrootcloudav.com/auth/token"
                        Method      = 'POST'
                    }
                }
            }
            else {
                write-verbose "Quiet mode enabled, but no cached credentials."
                return $false
            }
        }
        else {
            #this is a new connection
            $Params = @{
                Headers = @{
                    'Accept'        = 'application/json'
                    'Content-Type'  = 'application/x-www-form-urlencoded'
                    'Authorization' = 'Basic {0}' -f [convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($APISecrets.UserName + ':' + $APISecrets.GetNetworkCredential().Password))
                }
                Body = @{
                    username = $Credential.UserName
                    password = $Credential.GetNetworkCredential().Password
                    grant_type = "password"
                    'scope' = '*'
                }
                URI         = "https://unityapi.webrootcloudav.com/auth/token"
                Method      = 'POST'
            }

            Set-WRVariable -name "WRAPISecrets" -value $APISecrets | Out-Null
            Set-WRVariable -name "WRCredential" -value $Credential | Out-Null
        }
    }

    Process {
        try {
            $out = invoke-restmethod @Params

            Set-WRVariable -name "WRRefresh" -value $out | Out-Null
            Set-WRVariable -name "WRTokenTimeout" -value ((get-date).addseconds($out.expires_in))
            
        }
        catch {
            Throw $_.Exception.Message
        }
        
    }

    End {
        return $out
    }
}