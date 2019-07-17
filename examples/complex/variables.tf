
variable "tenancy_id" {}
variable "user_id" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "default_compartment_id" {}
variable "vcn_id" {}
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

