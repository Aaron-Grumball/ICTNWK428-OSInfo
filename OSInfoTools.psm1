# Gets the operating system currently being used
function Get-OperatingSystem {
    try {
        $operatingSystem = Get-WmiObject Win32_OperatingSystem -ErrorAction Stop
        return $operatingSystem.Caption
    }
    catch {
        Write-Host "Unable to retrieve operating system information."
    }
}

# Gets the current WinRM service status
function Get-WinRMStatus {
    try {
        $winRMService = Get-Service -Name WinRM -ErrorAction Stop
        return $winRMService.Status
    }
    catch {
        Write-Host "Unable to retrieve the Windows Remote Management service status."
    }
}

# Gets the computer manufacturer and model
function Get-ComputerManufacturerModel {
    try {
        $computerSystem = Get-WmiObject Win32_ComputerSystem -ErrorAction Stop
        return $computerSystem | Select-Object Manufacturer, Model
    }
    catch {
        Write-Host "Unable to retrieve the computer manufacturer and model."
    }
}

# Gets the computer name
function Get-ComputerName {
    try {
        $computerName = $env:COMPUTERNAME
        return $computerName
    }
    catch {
        Write-Host "Unable to retrieve the computer name."
    }
}

# Gets the computer domain name
function Get-DomainName {
    try {
        $computerSystem = Get-WmiObject Win32_ComputerSystem -ErrorAction Stop
        return $computerSystem.Domain
    }
    catch {
        Write-Host "Unable to retrieve the computer domain name."
    }
}

# Gets the configured TrustedHosts
function Get-TrustedHosts {
    try {
        $trustedHosts = Get-Item WSMan:\localhost\Client\TrustedHosts -ErrorAction Stop
        return $trustedHosts.Value
    }
    catch {
        Write-Host "Unable to retrieve TrustedHosts."
    }
}

# Gets the operating system architecture
function Get-OSArchitecture {
    try {
        $operatingSystem = Get-WmiObject Win32_OperatingSystem -ErrorAction Stop
        return $operatingSystem.OSArchitecture
    }
    catch {
        Write-Host "Unable to retrieve the operating system architecture."
    }
}

# Gets and displays all required system information
function Get-AllSystemInformation {
    try {
        Write-Output "Operating System: $(Get-OperatingSystem)"
        Write-Output "WinRM Status: $(Get-WinRMStatus)"

        $computerSystem = Get-ComputerManufacturerModel
        Write-Output "Manufacturer: $($computerSystem.Manufacturer)"
        Write-Output "Model: $($computerSystem.Model)"

        Write-Output "Computer Name: $(Get-ComputerName)"
        Write-Output "Domain Name: $(Get-DomainName)"
        Write-Output "TrustedHosts: $(Get-TrustedHosts)"
        Write-Output "OS Architecture: $(Get-OSArchitecture)"
    }
    catch {
        Write-Host "Unable to retrieve all system information."
    }
}