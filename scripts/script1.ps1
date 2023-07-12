

$Result = @()
#Get all Resource groups
$AllRGs = Get-AzResourceGroup
$TotalGroups = $AllRGs.Count
$i = 1 
ForEach ($RG in $AllRGs) {
Write-Progress -Activity "Processing $($RG.ResourceGroupName)" -Status "$i out of $TotalGroups Resource groups completed"
#Fetch virtual machines in the group
$VMList = Get-AzVM -ResourceGroupName $RG.ResourceGroupName -Status
  
ForEach ($VM in $VMList) {
$Result += New-Object PSObject -property $([ordered]@{ 
VMName = $VM.Name
VMStatus  = $VM.PowerState
ProvisioningState = $VM.ProvisioningState
ResourceGroup = $VM.ResourceGroupName
Location = $VM.Location
})
}
$i++
}
$Result | FT # alias Format Table

#$Result | Export-CSV -Path "C:/AllAzureVMStatus.CSV" -NoTypeInformation -Encoding UTF8