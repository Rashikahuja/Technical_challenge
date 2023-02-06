locals {
  database-vm = "dbserv-1"
  web-vm = "webserv-1"
  app-vm = "appserv-1"
  prefix = "challenge"
  resource_group_name = "${local.prefix}-rg"
  vnet_name = "${local.resource_group_name}-vnet"
  subnet-app = "app-subnet"
  subnet-db = "data-subnet"
  subnet-web = "web-subnet"
  nic-app = "nic-app"
  nic-db = "data-app"
  nic-web = "web-app"
  storage_os_disk_web = join("-", compact([local.prefix,"osdisk",var.stage_web,"1"]))
  storage_os_disk_app = join("-", compact([local.prefix,"osdisk",var.stage_app,"1"]))
  storage_os_disk_db  = join("-", compact([local.prefix,"osdisk",var.stage_db,"1"]))

}