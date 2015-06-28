<#
 
 Windows PowerShell profile script

 Put this somewhere Windows expects it, e.g. at the path returned by this command:
 
 > echo $profile
 
 In order to get PowerShell use it, you may need to set the execution policy.
 To allow local and remote-signed scripts, run (as administrator) this command:
 
 > Set-ExecutionPolicy RemoteSigned
 
#>

$profileDir = Split-Path $profile -parent

$here = (Split-Path -parent $MyInvocation.MyCommand.Definition)
. ($here + "\Scripts\Import-Module-Safe.ps1") -force

# Add $env:UserProfile\bin to path

$env:Path = $env:Path + ";$env:UserProfile\bin;"


# Load host-specific profile scripts
$hostProfilePath = $here + "\Hosts\" + $env:computername + ".pre.ps1"
if (Test-Path $hostProfilePath) {
  . $hostProfilePath
}

# Exit alias function.
function x { exit }

# Explorer alias functions.
function exp { explorer.exe . }


if ($gitBinDir -eq $null) {
  $gitBinDir = "C:\Program Files (x86)\Git\bin"
}

. ($here + "\Scripts\Import-PsGet-Modules.ps1") -force

. ($here + "\Scripts\New-PowerShell.ps1") -force

# Set path for Node.js npm modules.
$env:NODE_PATH = $env:APPDATA + "\npm\node_modules\"

# Mocha testing with CoffeeScript
Function mochac {
	mocha.cmd --compilers coffee:coffee-script $args
}

# Load posh-git example profile
$poshGitProfilePath = $here + "\Modules\posh-git\profile.example.ps1"
if (Test-Path $poshGitProfilePath) {
  $env:Path += ";" + $gitBinDir
  . $poshGitProfilePath

  # alias
  Function SshAgent {
    Start-SshAgent -Quiet
  }
}

# Load host-specific profile scripts
$hostProfilePath = $here + "\Hosts\" + $env:computername + ".ps1"
if (Test-Path $hostProfilePath) {
  . $hostProfilePath
}

# Sublime Text path
Set-Alias sublime "C:\Program Files\Sublime Text 2\sublime_text.exe"
