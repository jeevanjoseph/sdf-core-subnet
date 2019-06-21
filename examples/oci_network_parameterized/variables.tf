
variable "tenancy_id" {}
variable "user_id" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_id" {}
variable "vcn_name" {}
variable "vcn_cidr" {}
variable "vcn_dns_label" {}
variable "vcn_compartment_id" {}

variable "create_igw" {}
variable "create_svcgw" {}
variable "create_natgw" {}
variable "create_drg" {}
variable "create_vcn_wide_sl" {}

variable "svcgw_name" {}
variable "svcgw_compartment_id" {}
variable "svcgw_service_ids" {}

variable "natgw_name" {}
variable "natgw_compartment_id" {}
variable "natgw_block_traffic" {}

variable "igw_name" {}
variable "igw_compartment_id" {}
variable "igw_enabled" {}

variable "drg_name" {}
variable "drg_compartment_id" {}
variable "drg_route_table_id" {}

variable "vcn_wide_sl_options" {}

variable "subnet1_name" {}
variable "subnet1_compartment_id" {}
variable "subnet1_cidr" {}
variable "subnet1_create_rt" {}
variable "subnet1_rt_id" {}
variable "subnet1_rt_rules" {}
variable "subnet1_dhcp_options_create" {}
variable "subnet1_dhcp_options_type" {}
variable "subnet1_dhcp_forwarders" {}
variable "subnet1_dhcp_domain_name" {}
variable "subnet1_use_vcn_wide_sl" {}
variable "subnet1_sl2" {}
variable "subnet1_sl3" {}
variable "subnet1_sl4" {}

variable "subnet2_name" {}
variable "subnet2_compartment_id" {}
variable "subnet2_cidr" {}
variable "subnet2_create_rt" {}
variable "subnet2_rt_id" {}
variable "subnet2_rt_rules" {}
variable "subnet2_dhcp_options_create" {}
variable "subnet2_dhcp_options_type" {}
variable "subnet2_dhcp_forwarders" {}
variable "subnet2_dhcp_domain_name" {}
variable "subnet2_use_vcn_wide_sl" {}
variable "subnet2_sl2" {}
variable "subnet2_sl3" {}
variable "subnet2_sl4" {}

variable "subnet3_name" {}
variable "subnet3_compartment_id" {}
variable "subnet3_cidr" {}
variable "subnet3_create_rt" {}
variable "subnet3_rt_id" {}
variable "subnet3_rt_rules" {}
variable "subnet3_dhcp_options_create" {}
variable "subnet3_dhcp_options_type" {}
variable "subnet3_dhcp_forwarders" {}
variable "subnet3_dhcp_domain_name" {}
variable "subnet3_use_vcn_wide_sl" {}
variable "subnet3_sl2" {}
variable "subnet3_sl3" {}
variable "subnet3_sl4" {}