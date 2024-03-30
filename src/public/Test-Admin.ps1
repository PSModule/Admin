function Test-Admin {
    <#
        .SYNOPSIS
        Test if the current context is running as a specified role.

        .EXAMPLE
        Test-Role

        Test if the current context is running as an Administrator.
    #>
    [OutputType([System.Boolean])]
    [CmdletBinding()]
    [Alias('Test-Administrator', 'IsAdmin', 'IsAdministrator')]
    param()

    $IsUnix = $PSVersionTable.Platform -eq 'Unix'
    if ($IsUnix) {
        whoami -eq 'root'
    } else {
        $user = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal($user)
        $isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        $isAdmin
    }
}
