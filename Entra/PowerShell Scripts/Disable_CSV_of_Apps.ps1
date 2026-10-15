# Import the required module
Import-Module Microsoft.Graph.Applications

# Connect to Microsoft Graph with the required permissions
Connect-MgGraph -Scopes "Application.ReadWrite.All"

# Path to the CSV file
$csvPath = "<path to file>"

# Import the CSV
$appList = Import-Csv -Path $csvPath

foreach ($app in $appList) {
    $appId = $app.'App ID'

    # Get the application object by App ID
    $appObject = Get-MgServicePrincipal -Filter "appId eq '$appId'"

    if ($appObject) {
        # Delete/Remove the application
        Remove-MgServicePrincipal -ServicePrincipalId $appObject.Id
        Write-Host "Deleted application with App ID: $appId"
    } else {
        Write-Warning "Application with App ID $appId not found."
    }
}

# Disconnect the session
Disconnect-MgGraph
