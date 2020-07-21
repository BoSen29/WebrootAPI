---
external help file: WebrootAPI-help.xml
Module Name: WebrootAPI
online version:
schema: 2.0.0
---

# Invoke-WebrootAPIGeneric

## SYNOPSIS
Generic API request, handles the authentication and will automatically attempt to renegotiate the access token if it is out of date. 

## SYNTAX

```
Invoke-WebrootAPIGeneric [-Endpoint] <String> [-Method <String>] [<CommonParameters>]
```

## DESCRIPTION
Generic API request, handles the authentication and will automatically attempt to renegotiate the access token if it is out of date. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-WebrootAPIGeneric -endpoint "service/api/console/gsm/{GSM_KEY}/sites" -method GET
```

Returns the sites of the specified GSM key.

## PARAMETERS

### -Endpoint
The API endpoint

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
HTTP Method for the request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: GET, POST, PUT, DELETE

Required: False
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
