Connect-AzAccount

$report = @()

$vm_data = Get-AzVM -ResourceGroupName "challenge-rg"

#vmname
$vm = $vm_data.Name

#location
$loc = $vm_data.Location

#RG name
$rg = $vm_data.ResourceGroupName


#NIC ID
$nic = $vm_data.NetworkProfile.NetworkInterfaces.id

#NIC name
$nic_name = $nic.split('/')[-1]

#Vm status
$vmstatus = (Get-AzVM -Name $vm -Status).PowerState

#vm size
$vm_size = $vm_data.HardwareProfile.VmSize

#private IP
$IP = (Get-AzNetworkInterface -Name $nic_name).IpConfigurations.PrivateIpAddress

#subnet Name
$subnet_name = (Get-AzNetworkInterface -Name $nic_name).IpConfigurations.Subnet.Id.split('/')[-1]

#vnet Name
$vnet_name = (Get-AzNetworkInterface -Name $nic_name).IpConfigurations.Subnet.Id.split('/')[-3]

#instance ID
$vm_id = (Get-AzVM -Name $vm).Id

#NSG name
$nsg = (Get-AzNetworkInterface -Name $nic_name).NetworkSecurityGroup.Id.split('/')[-1]

#Host name
$hostname = $vm_data.OSProfile.ComputerName

#OS type
$OS_type = (Get-AzVM -Name $vm).StorageProfile.OsDisk.OsType

#OS disk Name
$OS_Disk = (Get-AzVM -Name $vm).StorageProfile.OsDisk.Name

#Creation date
$createdOn = (Get-AzVM -Name $vm).TimeCreated



$info = "" | Select Vm_name, location, ResourceGroupName, NIC_id, NIC_name, VM_status, Vm_size, Private_IP, Subnet_name, Vnet_name, instance_ID, NSG_name, hostname, OS_type, OS_disk_name, createdON




$info.Vm_name = $vm
$info.location = $loc
$info.ResourceGroupName = $rg
$info.NIC_id = $nic
$info.NIC_name = $nic_name
$info.VM_status = $vmstatus
$info.Vm_size = $vm_size
$info.Private_IP = $IP
$info.Subnet_name = $subnet_name
$info.Vnet_name = $vnet_name
$info.instance_ID = $vm_id
$info.NSG_name = $nsg
$info.hostname = $hostname
$info.OS_type = $OS_type
$info.OS_disk_name = $OS_Disk
$info.createdON = $createdOn.DateTime
$report+=$info

$report | ConvertTo-Json


