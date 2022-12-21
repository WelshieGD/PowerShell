# Set the path to the source and destination directories
$source = 'C:\Temp\Source'
$destination = 'C:\Temp\Destination'

# Create a FileSystemWatcher object and set its properties
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $source
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Create event handlers for the Created and Deleted events
$created = Register-ObjectEvent $watcher Created -SourceIdentifier FileCreated -Action {
    # Get the file that was created
    $file = $Event.SourceEventArgs.FullPath

    # Move the file to the destination directory and delete the original
    Move-Item $file $destination
    Remove-Item $file
}

# Run the script indefinitely
while ($true) {sleep 1}


<# To remove a regiestered event
Get-EventSubscriber

SubscriptionId   : 1
SourceObject     : System.IO.FileSystemWatcher
EventName        : Created
SourceIdentifier : FileCreated
Action           : System.Management.Automation.PSEventJob
HandlerDelegate  : 
SupportEvent     : False
ForwardEvent     : False

Then
Unregister-Subscriber -SubscriptionId 1

#>