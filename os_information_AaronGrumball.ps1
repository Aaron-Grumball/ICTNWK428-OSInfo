# Imports the module containing the system information functions
Import-Module "C:\OSInfoProject\OSInfoTools.psm1" -Force

# Sets the initial menu value so the loop can start
$menuSelection = 0

# Keeps displaying the menu until the user selects option 9
while ($menuSelection -ne 9) {

    # Displays the menu options
    Write-Host ""
    Write-Host "ITWorks Operating System Information Menu"
    Write-Host "1. Get operating system"
    Write-Host "2. Get Windows Remote Management service status"
    Write-Host "3. Get computer manufacturer and model"
    Write-Host "4. Get computer name"
    Write-Host "5. Get domain name"
    Write-Host "6. Get TrustedHosts"
    Write-Host "7. Get operating system architecture"
    Write-Host "8. Get all system information"
    Write-Host "9. Quit"

    # Validates the users input and only accepts numbers from 1 to 9
    do {
        $menuSelection = Read-Host "Enter a menu selection from 1 to 9"

        if ($menuSelection -notmatch '^[1-9]$') {
            Write-Host "Invalid selection. Please enter a number from 1 to 9."
        }
    }
    until ($menuSelection -match '^[1-9]$')

    # Calls the correct function based on the users menu selection
    switch ($menuSelection) {
        "1" {
            Get-OperatingSystem
        }

        "2" {
            Get-WinRMStatus
        }

        "3" {
            Get-ComputerManufacturerModel | Out-Host
        }

        "4" {
            Get-ComputerName
        }

        "5" {
            Get-DomainName
        }

        "6" {
            Get-TrustedHosts
        }

        "7" {
            Get-OSArchitecture
        }

        "8" {
            Get-AllSystemInformation
        }

        "9" {
            Write-Host "Exiting program"
        }
    }
}