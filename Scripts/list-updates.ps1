﻿<#
.SYNOPSIS
	Lists software updates
.DESCRIPTION
	This PowerShell script queries the latest available software updates for the local machine and lists it.
	NOTE: Use the script 'install-updates.ps1' to install the listed updates.
.EXAMPLE
	PS> ./list-updates.ps1

	Name                   Id                                Version       Available        Source
	--------------------------------------------------------------------------------------------------
	Git                    Git.Git                           2.41.0        2.41.0.2         winget
        ...
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	if ($IsLinux) {
		"⏳ (1/2) Querying package updates..."
		& sudo apt update
		& sudo apt list --upgradable
		"⏳ (2/2) Querying Snap updates..."
		& sudo snap refresh --list
	} else {
		Write-Progress "Querying the latest updates from winget and Microsoft Store..."
		" "
		& winget upgrade --include-unknown
		Write-Progress -completed "Done."
	}
	"                                                       (use 'install-updates.ps1' to install the listed updates)"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
