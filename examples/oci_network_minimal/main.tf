// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

module "oci_network" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id = "${var.compartment_id}"
  
  vcn_options = {
    display_name      = "Tim's test"
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
  
  create_vcn_wide_sl  = false

  vcn_wide_sl_options = {
    display_name   = "test-SL"
    compartment_id = null
    ingress_rules = null
    egress_rules = [
      {
        stateless = true
        protocol  = "6"
        dst      = "10.0.0.0/24"
        dst_type = "CIDR_BLOCK"
        src_port = {
          min = 22
          max = 22
        }
        dst_port = null
        icmp_type = null
        icmp_code = null
      },
      {
        stateless = true
        protocol  = "6"
        dst      = "10.0.0.16/28"
        dst_type = "CIDR_BLOCK"
        src_port = null
        dst_port = {
          min = 80
          max = 80
        }
        icmp_type = null
        icmp_code = null
      },
      {
        stateless = true
        protocol  = "6"
        dst      = "10.0.0.32/28"
        dst_type = "CIDR_BLOCK"
        src_port = {
          min = 55000
          max = 65535
        }
        dst_port = {
          min = 80
          max = 80
        }
        icmp_type = null
        icmp_code = null
      }
    ]
  }
}
