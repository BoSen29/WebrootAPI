function Invoke-WebrootAPIGeneric {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0
        )]
        [string]
        $Endpoint,
        # Method
        [Parameter(
            Mandatory = $false)]
        [ValidateSet(
            'GET',
            'POST',
            'PUT',
            'DELETE'
        )]
        [String]
        $Method = "GET"
    )

    Begin {
        $Endpoint = "https://unityapi.webrootcloudav.com/$Endpoint"

        if ((Get-WRVariable -name "WRTokenTimeout") -lt (Get-Date).Addseconds(-60)) {
            Connect-WebrootAPI -Refresh | out-null
        }

        $Params = @{
            Headers = @{
                "Authorization" = "Bearer $((Get-WRVariable -name WRRefresh).access_token)"
            }
            URI = $Endpoint
            Method = $Method
        }
    }

    Process {
        $out = invoke-restmethod @Params
    }

    End {
        return $out
    }
}