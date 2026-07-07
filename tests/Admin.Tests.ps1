#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '6.0.0'; MaximumVersion = '6.*'; GUID = 'a699dea5-2c73-4616-a270-1f7abb777e71' }

Describe 'Admin' {
    Context 'Function: Test-Admin' {
        It 'Should not throw' {
            { Test-Admin } | Should -Not -Throw
        }

        It 'Should return <Expected> for <OS> based runners' -ForEach @(
            @{
                Expected = if ($IsLinux -or $IsMacOS) {
                    $false
                } else {
                    $true
                }
                OS       = if ($IsLinux -or $IsMacOS) {
                    'Unix'
                } else {
                    'Windows'
                }
            }
        ) {
            Test-Admin | Should -Be $expected
        }
    }
}
