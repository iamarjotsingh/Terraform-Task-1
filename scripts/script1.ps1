# Install-Module -Name Az -AllowClobber -Scope CurrentUser
# Import-Module -Name Az


# $Result = @()
# #Get all Resource groups
# $AllRGs = Get-AzResourceGroup
# $TotalGroups = $AllRGs.Count
# $i = 1 
# ForEach ($RG in $AllRGs) {
# Write-Progress -Activity "Processing $($RG.ResourceGroupName)" -Status "$i out of $TotalGroups Resource groups completed"
# #Fetch virtual machines in the group
# $VMList = Get-AzVM -ResourceGroupName $RG.ResourceGroupName -Status
  
# ForEach ($VM in $VMList) {
# $Result += New-Object PSObject -property $([ordered]@{ 
# VMName = $VM.Name
# VMStatus  = $VM.PowerState
# ProvisioningState = $VM.ProvisioningState
# ResourceGroup = $VM.ResourceGroupName
# Location = $VM.Location
# })
# }
# $i++
# }
# $Result | FT # alias Format Table

# # $Result | Export-CSV -Path "/usr/bin/pwsh/AllAzureVMStatus.CSV" -NoTypeInformation -Encoding UTF8

# Install Azure PowerShell module if not already installed
# Uncomment the following line if Azure PowerShell module is not installed
Set-ExecutionPolicy Bypass -Scope Process -Force

Install-Module -Name Az -AllowClobber -Scope CurrentUser
Import-Module -Name Az

# Connect to your Azure account
# Connect-AzAccount

# Get all Azure VMs in the subscription
$allVms = Get-AzVM

# Iterate through each VM and retrieve its status, resource group name, and location
foreach ($vm in $allVms) {
    $vmName = $vm.Name
    $resourceGroupName = $vm.ResourceGroupName
    $location = (Get-AzResourceGroup -Name $resourceGroupName).Location
    $status = $vm.Statuses[1].DisplayStatus

    # Output the VM status, resource group name, and location
    Write-Output "VM Name: $vmName"
    Write-Output "Status: $status"
    Write-Output "Resource Group: $resourceGroupName"
    Write-Output "Location: $location"
   
}
