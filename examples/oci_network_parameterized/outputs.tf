// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

output "vcn" {
  description = "VCN"
  value       = module.oci_network.vcn
}

output "igw" {
  description = "IGW"
  value       = module.oci_network.igw
}

output "svcgw" {
  description = "SVCGW"
  value       = module.oci_network.svcgw
}

output "svcgw_services" {
  description = "SVCGW Services"
  value       = module.oci_network.svcgw_services
}

output "natgw" {
  description = "NATGW"
  value       = module.oci_network.natgw
}

output "drg" {
  description = "DRG"
  value       = module.oci_network.drg
}
