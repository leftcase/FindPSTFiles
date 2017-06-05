# Powershell Script to find local .pst files

This script searches a Windows computer for local .pst files and writes a list of any found to a file stored on a network share. 

Files created by this script have the naming convention HOSTNAME-USERNAME.txt

## Instructions 

* Create a shared folder and configure security to allow all users to modify/create files
* Configure $destDir = "\\YOURSERVERHERE" to point at your shared folder (leave a trailing slash)
* Use Group Policy (or other) to run the script at user logon
