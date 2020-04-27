Invoke-WebRequest -Uri https://download.sysinternals.com/files/PSTools.zip -Outfile 'c:\Users\IEUser\Downloads\PSTools.zip'
7z e -oc:\Users\IEUser\Downloads\PSTools c:\Users\IEUser\Downloads\PSTools.zip
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Users\IEUser\Downloads\PSTools", "Machine")
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Users\IEUser\Downloads\PSTools", "User")