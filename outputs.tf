// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved..

#########################
## Subnets
#########################
output "subnets" {
  description = "The returned resource attributes for the subnets."
  value       = {
    for x in oci_core_subnet.this:
      x.display_name => x
  }
}

#########################
## ADs
#########################
output "ads" {
  description = "The different Availability Domains available."
  value       = data.oci_identity_availability_domains.this
}
