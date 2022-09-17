
# Get your credentials
$user = $env:USERNAME
$password = Read-Host -AsSecureString -Prompt "Secret: "
$password | ConvertFrom-SecureString | Out-File "$HOME\cred"
$passwordRetrieved = Get-Content "$Home\cred" | ConvertTo-SecureString


# Make credential objects- the top one just graps the SecureString in memory

$cred = New-Object -TypeName System.Management.Automation.PSCredential `
 -ArgumentList $User, $password

# This one uses the encrypted string stored in your $HOME folder- almost as convenient
# as leaving it plaintext. But much less problematic.
$cred2 = New-Object -TypeName System.Management.Automation.PSCredential `
 -ArgumentList $User, $passwordRetrieved

 # Just to show that it works.
 Start-Process powershell.exe -Runas $cred -ArgumentList "-noexit whoami"

 Start-Process powershell.exe -Runas $cred2 -ArgumentList "-noexit whoami"


 # Example code to check if the user has already cached their creds:
 if (Test-Path -Path "$HOME\cred") {
 $pass = = Get-Content "$Home\cred" | ConvertTo-SecureString
 } else {
$password = Read-Host -AsSecureString -Prompt "Secret: "
$password | ConvertFrom-SecureString | Out-File "$HOME\cred"
 } 
$yourCredential = New-Object -TypeName System.Management.Automation.PSCredential `
 -ArgumentList $env:USERNAME, $passwordRetrieved


 # Do your fun stuff with the above credential
