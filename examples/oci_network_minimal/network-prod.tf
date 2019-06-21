// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

module "prod_oci_network" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id = "${var.compartment_id}"
  
  vcn_options = {
    display_name      = "Tim's test - Prod"
    cidr              = "10.0.0.0/24"
    dns_label         = "timvcn"
    compartment_id    = null
  }
  
  svcgw_options = {
    display_name      = "svcgw"
    compartment_id    = null
    services          = [
      module.oci_network.svcgw_services.0.id
    ]
  }

  natgw_options = {
    display_name     = "natgw"
    compartment_id   = null
    block_traffic    = false
  }

  igw_options = {
    display_name     = "my_igw"
    compartment_id   = null
    enabled          = false
  }

  drg_options = {
    display_name     = "my_drg"
    compartment_id   = null
    route_table_id   = null
  }

  create_igw          = true
  create_svcgw        = true
  create_natgw        = true
  create_drg          = true
}
