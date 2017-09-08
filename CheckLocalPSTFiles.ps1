<# 
Copyright (C) 2017 Chris Rowson - christopherrowson@gmail.com
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
#>

$destDir = "\\YOUR_SERVER_HERE\" 
$hostName = [System.Net.Dns]::GetHostName()
$userName = [Environment]::UserName
$fullPath = $destDir + $hostName + "-" + $userName + ".txt"

New-Item -Path $fullPath -type file
if ($? -eq $False) #last command unsuccessful file probably already exists
    {exit}

$userPath = Get-ChildItem Env:USERPROFILE #grab the user profile path 
$userProfile = $userPath.Value

if ($userProfile -match '^C:') #regex to match only profiles on C:
    {
    $files = Get-ChildItem -Recurse -Path $userProfile -Include *.pst -Force -Erroraction 'silentlycontinue'`
    | Where-Object {$_.PSIsContainer -ne $True} #where it isn't a container (folder)
    foreach ($file in $files)
        {
        Add-Content -path $fullPath $file.FullName
        }
    }
    
    
