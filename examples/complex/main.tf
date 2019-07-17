// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

module "oci_subnets" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id  = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id                  = oci_core_vcn.this.id
  vcn_cidr                = oci_core_vcn.this.cidr_block
  subnets                 = var.subnets
}

resource "oci_core_vcn" "this" {
  dns_label      = "temp"
  cidr_block     = "192.168.0.0/16"
  compartment_id = var.default_compartment_id
  display_name   = "temp"
}

