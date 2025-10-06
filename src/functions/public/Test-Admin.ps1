function Test-Admin {
    <#
        .SYNOPSIS
        Test if the current context is running as a specified role.

        .DESCRIPTION
        This function checks if the current user context has Administrator privileges on Windows or is root on Unix-based systems.
        It returns $true if the user has the required privileges, otherwise $false.

        .EXAMPLE
        ```pwsh
        Test-Admin
        ```

        Test if the current context is running as an Administrator.

        .LINK
        https://psmodule.io/Admin/Functions/Test-Admin/
    #>
    [OutputType([System.Boolean])]
    [CmdletBinding()]
    [Alias('Test-Administrator', 'IsAdmin', 'IsAdministrator')]
    param()

    $IsUnix = $PSVersionTable.Platform -eq 'Unix'
    if ($IsUnix) {
        Write-Verbose "Running on Unix, checking if user is root."
        $whoAmI = $(whoami)
        Write-Verbose "whoami: $whoAmI"
        $IsRoot = $whoAmI -eq 'root'
        Write-Verbose "IsRoot: $IsRoot"
        $IsRoot
    } else {
        Write-Verbose "Running on Windows, checking if user is an Administrator."
        $user = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal($user)
        $isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        Write-Verbose "IsAdmin: $isAdmin"
        $isAdmin
    }
}
