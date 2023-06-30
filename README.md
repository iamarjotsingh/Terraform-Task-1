Firstly, created Resources with Terraform 

Required things to create a VM - 
- Resource Group
- Virtual Network
- Subnet
- Network Interface Card
- Public IP/ Private IP
- Network Security Group
- OS Disk/ Data Disk
- Operating System
- UserID and Password


az ad sp create-for-rbac --name "github-action-spn" --role contributor --scopes /subscriptions/4b50cbcf-4b03-4246-8de5-682f205947f6 --sdk-auth

{
  "clientId": "500c15b1-5ef5-4947-bad0-98b5ec7a4c77",
  "clientSecret": "9~d8Q~AeWl76QaakoQ.zNXv-yCLklT.0Q.diic1D",
  "subscriptionId": "4b50cbcf-4b03-4246-8de5-682f205947f6",
  "tenantId": "f2a452cc-8fe5-4e34-b14d-1e82d76f654e",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}