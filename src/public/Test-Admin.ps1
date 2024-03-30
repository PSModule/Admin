﻿function Test-Admin {
    <#
        .SYNOPSIS
        Test if the current context is running as a specified role.

        .DESCRIPTION
        Test if the current context is running as a specified role.

        .EXAMPLE
        Test-Role -Role Administrator

        Test if the current context is running as an Administrator.

        .EXAMPLE
        Test-Role -Role User

        Test if the current context is running as a User.

        .NOTES
        Supported OS: Windows
    #>
    [OutputType([Boolean])]
    [CmdletBinding()]
    [alias('Test-Role', 'Test-Administrator', 'IsAdmin', 'IsAdministrator')]
    param(
        # Role to test
        [Parameter()]
        [Security.Principal.WindowsBuiltInRole] $Role = 'Administrator'
    )

    Write-Verbose "Test Role - [$Role]"
    $user = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($user)
    $isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::$Role)
    Write-Verbose "Test Role - [$Role] - [$isAdmin]"
    $isAdmin
}
