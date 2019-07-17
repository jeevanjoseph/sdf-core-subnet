// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

data "oci_core_vcn" "subnets_vcn" {
    #Required
    vcn_id = var.vcn_id
}

module "oci_subnets" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id  = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id                  = var.vcn_id
  vcn_cidr                = data.oci_core_vcn.subnets_vcn.cidr_block
  subnets                 = var.subnets
}


