﻿[CmdletBinding()]
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

    Context 'Function: Test-Admin' {
        It 'should not throw' {
            { Test-Admin } | Should -Not -Throw
        }

        It 'should return true' {
            $IsUnix = $PSVersionTable.Platform -eq 'Unix'
            if ($IsUnix) {
                $IsAdmin = $(sudo pwsh -command "Test-Admin")
            } else {
                $IsAdmin = Test-Admin
            }
            $IsAdmin | Should -Be $true
        }
    }
}
