---
external help file: WebrootAPI-help.xml
Module Name: WebrootAPI
online version:
schema: 2.0.0
---

# Get-WRVariable

## SYNOPSIS
Gets the specified variable, either from the $cache variable when using Universal Dashboard, or $script:$variable

## SYNTAX

```
Get-WRVariable [-name] <String> [<CommonParameters>]
```

## DESCRIPTION
Gets the specified variable, either from the $cache variable when using Universal Dashboard, or $script:$variable

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-WRVariable -Name "WRRefresh"
```

Returns the last auth status.

## PARAMETERS

### -name
Name of the variable

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
