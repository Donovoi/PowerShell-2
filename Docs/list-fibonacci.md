## The *list-fibonacci.ps1* PowerShell Script

list-fibonacci.ps1 


## Parameters
```powershell


[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Source Code
```powershell
<#
.SYNOPSIS
	Lists the Fibonacci numbers
.DESCRIPTION
	This PowerShell script lists the Fibonacci numbers.
.EXAMPLE
	PS> ./list-fibonacci
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

function fibonacci($n) {
    if ($n -lt 2) { return 1 }
    return (fibonacci($n - 1)) + (fibonacci($n - 2))
}


foreach ($i in 0..100) {
    Write-Host "$(fibonacci $i), " -noNewline
}
exit 0 # success
```

*Generated by convert-ps2md.ps1 using the comment-based help of list-fibonacci.ps1*