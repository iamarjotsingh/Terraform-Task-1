$Result = @()
#Get all Resource groups
$AllRGs = Get-AzureRMResourceGroup
$TotalGroups = $AllRGs.Count
$i = 1 
ForEach ($RG in $AllRGs) {
Write-Progress -Activity "Processing $($RG.ResourceGroupName)" -Status "$i out of $TotalGroups Resource groups completed"
#Fetch virtual machines in the group
$VMList = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName -Status
  
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
#$Result | FT
$Result | Export-CSV "csv-file.CSV" -NoTypeInformation -Encoding UTF8