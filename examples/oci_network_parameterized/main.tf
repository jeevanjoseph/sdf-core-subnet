// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

module "oci_network" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id = var.compartment_id
  
  vcn_options = {
    display_name      = var.vcn_name
    cidr              = var.vcn_cidr
    dns_label         = var.vcn_dns_label
    compartment_id    = var.vcn_compartment_id
  }
  
  svcgw_options = {
    display_name      = var.svcgw_name
    compartment_id    = var.svcgw_compartment_id
    services          = var.svcgw_service_ids
  }

  natgw_options = {
    display_name      = var.natgw_name
    compartment_id    = var.natgw_compartment_id
    block_traffic     = var.natgw_block_traffic
  }

  igw_options = {
    display_name      = var.igw_name
    compartment_id    = var.igw_compartment_id
    enabled           = var.igw_enabled
  }

  drg_options = {
    display_name     = var.drg_name
    compartment_id   = var.drg_compartment_id
    route_table_id   = var.drg_route_table_id
  }

  create_igw          = var.create_igw
  create_svcgw        = var.create_svcgw
  create_natgw        = var.create_natgw
  create_drg          = var.create_drg
  create_vcn_wide_sl  = var.create_vcn_wide_sl

  vcn_wide_sl_options = var.vcn_wide_sl_options

  subnet_names = [
    var.subnet1_name, 
    var.subnet2_name, 
    var.subnet3_name
    ]
  subnet_compartment_ids  = [
    var.subnet1_compartment_id, 
    var.subnet2_compartment_id
    var.subnet3_compartment_id
    ]
  subnet_cidrs        = [
    var.subnet1_cidr, 
    var.subnet2_cidr, 
    var.subnet3_cidr
  ]
  subnet_create_rts   = [
    var.subnet1_create_rt,
    var.subnet2_create_rt,
    var.subnet3_create_rt
  ]
  subnet_rt_ids       = [
    var.subnet1_rt_id,
    var.subnet2_rt_id,
    var.subnet3_rt_id
  ]
  subnet_rt_rules     = [
    var.subnet1_rt_rules,
    var.subnet2_rt_rules,
    var.subnet3_rt_rules
  ]
  subnet_dhcp_options_create  = [
    var.subnet1_dhcp_options_create,
    var.subnet2_dhcp_options_create,
    var.subnet3_dhcp_options_create
  ]
  subnet_dhcp_options_type = [
    var.subnet1_dhcp_options_type,
    var.subnet2_dhcp_options_type,
    var.subnet3_dhcp_options_type
  ]
  subnet_dhcp_forwarders = [
    var.subnet1_dhcp_forwarders,
    var.subnet2_dhcp_forwarders,
    var.subnet3_dhcp_forwarders
  ]
  subnet_dhcp_domain_names  = [
    var.subnet1_dhcp_domain_name,
    var.subnet2_dhcp_domain_name,
    var.subnet3_dhcp_domain_name
  ]
  subnet_use_vcn_wide_sl  = [
    var.subnet1_use_vcn_wide_sl,
    var.subnet2_use_vcn_wide_sl,
    var.subnet3_use_vcn_wide_sl
  ]
  subnet_security_lists = [
    [
      var.subnet1_sl2,
      var.subnet1_sl3,
      var.subnet1_sl4
    ],
    [
      var.subnet2_sl2,
      var.subnet2_sl3,
      var.subnet2_sl4
    ],
    [
      var.subnet3_sl2,
      var.subnet3_sl3,
      var.subnet3_sl4
    ]
  ]

}
