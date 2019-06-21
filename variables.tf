// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

# Global variables

variable "default_compartment_id" {
  type                = string
  description         = "The default compartment OCID to use for resources (unless otherwise specified)."
}

variable "vcn_id" {
  type        = string
  description = "The VCN ID where the Subnet(s) should be created."
}

variable "vcn_cidr" {
  type        = string
  description = "The CIDR of the VCN (used when dynamically generating subnet CIDRs, if a specific CIDR is not otherwise given)."
}

# Subnet-specific variables
variable "subnets" {
  type                = map(object({
    compartment_id    = string,
    dynamic_cidr      = bool,
    cidr              = string,
    cidr_len          = number,
    cidr_num          = number,
    enable_dns        = bool,
    dns_label         = string,
    private           = bool,
    ad                = number,
    dhcp_options_id   = string,
    route_table_id    = string,
    security_list_ids = list(string)
  }))
  description         = "Parameters for each subnet to be created/managed."
  default             = {
    compartment_id    = null
    dynamic_cidr      = null
    cidr              = null
    cidr_len          = null
    cidr_num          = null
    enable_dns        = null
    dns_label         = null
    private           = null
    ad                = null
    dhcp_options_id   = null
    route_table_id    = null
    security_list_ids = null
  }
}
