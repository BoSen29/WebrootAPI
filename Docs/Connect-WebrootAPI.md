---
external help file: WebrootAPI-help.xml
Module Name: WebrootAPI
online version:
schema: 2.0.0
---

# Connect-WebrootAPI

## SYNOPSIS
Connect to the Webroot API, and manages tokens.

## SYNTAX

### Standard (Default)
```
Connect-WebrootAPI [-Credential] <PSCredential> [-APISecrets] <PSCredential> [<CommonParameters>]
```

### Refresh
```
Connect-WebrootAPI [-Refresh] [<CommonParameters>]
```

## DESCRIPTION
Either specify both Webroot credentials for a user and API tokens or use the -refresh switch in order to attempt refreshing with cached credentials.

## EXAMPLES

### Example 1
```powershell
PS C:\> Connect-WebrootAPI -credential $credential -apisecrets $APISecrets
```

Connects to the Webroot API with the specified credentials.

## PARAMETERS

### -APISecrets
API Secrets - both API user and API secret found under "API Permissions"

```yaml
Type: PSCredential
Parameter Sets: Standard
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
An account with access to the Webroot panel, used for the initial token, and cached incase the the refresh fails. 

```yaml
Type: PSCredential
Parameter Sets: Standard
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Refresh
Switch to allow automatic refresh of the access token.

```yaml
Type: SwitchParameter
Parameter Sets: Refresh
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
