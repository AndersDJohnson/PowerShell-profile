# Doesn't work for keeping pwd with New-Powershell
#cd $env:UserProfile

(Get-PSProvider FileSystem).Home = "\\mspsw2kfp1\users\johna10"
