<#
 http://blogs.technet.com/b/heyscriptingguy/archive/2010/07/11/hey-scripting-guy-weekend-scripter-checking-for-module-dependencies-in-windows-powershell.aspx

 http://stackoverflow.com/questions/10498433/how-to-correctly-ignore-import-module-errors-in-powershell
#>

Function Import-Module-Safe
{ 
    Param([string] $name)
    if ( -not ( Get-Module -name $name ) )
    {
        if ( Get-Module -ListAvailable | Where-Object { $_.name -eq $name } )
        {
            Import-Module -Name $name
            $true
        } #end if module available then import
        else { $false } #module not available 
    } # end if not module 
    else { $true } #module already loaded 
}
