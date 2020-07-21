---
external help file: WebrootAPI-help.xml
Module Name: WebrootAPI
online version:
schema: 2.0.0
---

# Set-WRVariable

## SYNOPSIS
Sets the specified variable, either from the $cache variable when using Universal Dashboard, or $script:$variable

## SYNTAX

```
Set-WRVariable [-name] <String> [-value] <Object> [<CommonParameters>]
```

## DESCRIPTION
Sets the specified variable, either from the $cache variable when using Universal Dashboard, or $script:$variable

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-WRVariable -Name "WRRefresh" -value $null
```

Sets the $script:WRRefresh to $null

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
Accept pipeline input: False
Accept wildcard characters: False
```

### -value
Value to set the variable.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
