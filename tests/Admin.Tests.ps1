[CmdletBinding()]
Param(
    # Path to the module to test.
    [Parameter()]
    [string] $Path
)

Write-Verbose "Path to the module: [$Path]" -Verbose

Describe 'Admin' {
    Context 'Module' {
        It 'The module should be available' {
            Get-Module -Name 'Admin' -ListAvailable | Should -Not -BeNullOrEmpty
            Write-Verbose (Get-Module -Name 'Admin' -ListAvailable | Out-String) -Verbose
        }
        It 'The module should be importable' {
            { Import-Module -Name 'Admin' -Verbose -RequiredVersion 999.0.0 -Force } | Should -Not -Throw
        }
    }

    Context 'Functions' {
        It 'Test-Admin' {
            { Test-Admin } | Should -Not -Throw
        }

        It 'EUID is not null' {
            Write-Verbose "EUID: $EUID" -Verbose
            $EUID | Should -Not -BeNullOrEmpty
        }

        It "whoami == 'root'" {
            Write-Verbose "whoami: $(whoami)" -Verbose
            whoami | Should -Be "root"
    }
}
