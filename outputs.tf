// Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

#########################
## VCN
#########################
output "subnets" {
  description = "The returned resource attributes for the subnets."
  value       = {
    for x in oci_core_subnet.this:
      x.display_name => x
  }
}
