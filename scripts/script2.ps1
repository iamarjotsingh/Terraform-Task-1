Get-ExecutionPolicy
Start-Sleep -Seconds 30
Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy RemoteSigned -Force
Start-Sleep -Seconds 30
Install-Module posh-git -Scope CurrentUser -Force
Start-Sleep -Seconds 30
Install-Module PowerShellGet -Force -SkipPublisherCheck
Start-Sleep -Seconds 30
Import-Module posh-git
Start-Sleep -Seconds 30
Add-PoshGitToProfile -AllHosts​​​​​​​
















# # Variables
# $resourceGroupName = "terrform-amar-rg1"
# $vmName = "tf-vm"

# # Get the VM object
# $vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# # Check if Docker is already installed
# if ($vm.Extensions | Where-Object { $_.Publisher -eq "Microsoft.Azure.Extensions" -and $_.VirtualMachineExtensionType -eq "DockerExtension" }) {
#     Write-Host "Docker is already installed on the VM."
# } else {
#     # Add the Docker extension to the VM
#     Set-AzVMExtension -ResourceGroupName $resourceGroupName -VMName $vmName `
#         -Name "DockerExtension" -Publisher "Microsoft.Azure.Extensions" `
#         -Type "DockerExtension" -TypeHandlerVersion "1.4" `
#         -SettingString '{"docker": {"port": "2375"}}'

#     # Update the VM
#     Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm

#     # Wait for the VM to be updated
#     $vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
#     while ($vm.Extensions | Where-Object { $_.ProvisioningState -eq "Creating" -or $_.ProvisioningState -eq "Updating"}) {
#         Write-Host "Waiting for VM update..."
#         Start-Sleep -Seconds 30
#         $vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName
#     }

#     Write-Host "Docker has been installed on the VM."
# }
