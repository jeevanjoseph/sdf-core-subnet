# Oracle Cloud Infrastructure (OCI) Terraform Subnet Module

## Introduction


This module assist in building one or more new Subnet(s) in OCI.

## Solution

Subnets are the home for many IP-based resources in OCI.  Much like a VLAN in traditional on-prem LANs, it's a foundational component in a OCI cloud environment.

| Resource | Created by Default? |
|---|---|
| Subnet(s) | No |

### Prerequisites
This module does not create any dependencies or prerequisites (these must be created prior to using this module):

* VCN
* Security List(s)
  * The *network_security* module may be used to create and manage Security Lists.
* Route Table
  * Often times only a couple of routing policies exist and are created in the *network* module.
* DHCP Options
  * Often times only a couple of DHCP Options (DNS profiles) exist and are created in the *network* module.

### Resource-specific inputs

#### Subnet

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| default\_compartment\_id | string | yes | none | string of the compartment OCID | This is the default OCID that will be used when creating objects (unless overridden for any specific object).  This needs to be the OCID of a pre-existing compartment (it will not create the compartment. |
| vcn\_id | string | yes | N/A (no default) | The OCID of the VCN in which the subnet(s) are to be created. |
| vcn\_cidr | string | no | N/A (no default) | The CIDR used by the VCN.  This is only needed when dynamically generating subnet CIDRs.
| default\_defined\_tags | map(string) | {} | Any map of tag names and values that is acceptable to the OCI API. | These are the Defined Tags that will be set on resources (unless they're overridden at the resource level). |
| default\_freeform\_tags | map(string) | {} | Any map of tag names and values that is acceptable to the OCI API. | These are the Freeform Tags that will be set on resources (unless they're overridden at the resource level). |
| subnets | map | no | see below | see below | The parameters used to create the subnets. |

**subnets**

The `subnets` attribute is an optional map object attribute.  Note that if this attribute is used, all keys/values must be specified (Terraform does not allow for default or optional map keys/values).

Each entry's key specifies the name to be given to the subnet, with its attributes specified as values in a sub-map.

Each entry has the following defined keys (and default values):

| Key | Data Type | Default Value | Valid Values | Description |
|---|---|---|---|---|
| compartment\_id | string | null | Compartment OCID | Pre-existing compartment OCID (if default compartment is not to be used).  If this value is null, the default compartment OCID will be used. |
| defined\_tags | map(string) | var.default\_defined\_tags | Any map of tag names and values that is acceptable to the OCI API. | If any Defined Tags should be set on this resource, do so with this attribute (otherwise the default Defined Tags will be used). |
| freeform\_tags | map(string) | var.default\_freeform\_tags | Any map of tag names and values that is acceptable to the OCI API. | If any Freeform Tags should be set on this resource, do so with this attribute (otherwise the default Freeform Tags will be used). |
| dynamic_cidr | bool | false | true/false | Whether or not the CIDR should be dynamically calculated (true) or statically set (false). |
| cidr | string | static cidr: null, dynamic_cidr: VCN CIDR | IPv4 CIDR | Specify the IPv4 CIDR to be used for the Subnet.  If dynamic_cidr is true, the CIDR specified here will be used in the subnet calculation.  If dynamic_cidr is false, the CIDR specified here will be the one used by the subnet. |
| cidr\_len | number | 28 | Any number between 16 and 30 | This is the desired bit length (number of bits in the subnet mask) for the new, dynamically generated subnet CIDR.  Only applicable if dynamic_cidr is true. |
| cidr\_num | number | Defaults to the index number of the subnet being defined | This is the zero-indexed network number that should be used for the subnet.  For example, let's say that cidr is 192.168.0.0/16 and cidr\_len is 24.  For cidr\_num of 1, a dynamically generated CIDR of 192.168.1.0/24 would be given.  In the same scenario, with a cidr\_num of 0, 192.168.0.0/24 would result and cidr\_num of 240 would yield 192.168.240.0/24. |
| enable\_dns | bool | true | Whether or not DNS should be enabled for the subnet. |
| dns\_label | string | "vcn" | Valid DNS name. | Specify the DNS label to be used for the VCN.  If this value is null, a dynamically generated value of *subnet<index_num>* will be used.  For example, the third subnet definition, if DNS is enabled, but no dns_label is provided (a null value is given), a value of *subnet2* will be generated (remembering that index numbers are zero-indexed). |
| private | bool | true | true/false | If set to true, the subnet will be a private subnet.  If set to false, a public subnet will be created. |
| ad | number | null | null, 0, 1 or 2 (dependent upon the number of available Availability Domains (ADs) in the specific region being used) | If a regional subnet is desired, leave this value as null, otherwise specify the AD number (zero-index, meaning AD1 = 0, AD2 = 1, AD3 = 2) to create an AD-specific subnet. |
| dhcp\_options\_id | string | null | null or OCID | Specify the OCID of the DHCP Options to use for the subnet. |
| route\_table\_id | string | null | null or OCID | Specify the OCID of the Route Table to use for the subnet. |
| security\_list\_ids | list of strings | null | null or list of OCID(s) | Specify the OCID(s) of the Security List(s) to use for the subnet, in list form. |

Example:

```
module "oci_subnets" {
  ... /snip - shortened for brevity...

  default_compartment_id  = var.default_compartment_id
  # vcn_id = data.terraform_remote_state.network.outputs.vcn.id
  vcn_id                  = oci_core_vcn.this.id
  vcn_cidr                = oci_core_vcn.this.cidr_block
  
  subnets = {
    test1 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = "192.168.0.0/30"
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "test1"
      private           = true
      ad                = null
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    },
    test2 = {
      compartment_id    = null
      defined_tags      = null
      freeform_tags     = null
      dynamic_cidr      = false
      cidr              = "192.168.0.4/30"
      cidr_len          = null
      cidr_num          = null
      enable_dns        = true
      dns_label         = "test2"
      private           = true
      ad                = 0
      dhcp_options_id   = null
      route_table_id    = null
      security_list_ids = null
    }
  }
}
```

The above example will create two subnets, *test1* and *test2*.  Each of these will use the default compartment OCID (not shown in the above example) and will use statically-defined CIDRs.

### Outputs

A map containing each subnet is returned in the *subnets* output.  The outer map key is the name of the subnet, with all subnet attributes (as a map) being returned as the value.

## Getting Started

Several fully-functional examples have been provided in the `examples` directory.  For a quick-start guide, at minimum, you need the following (for the most basic deployment):

```
module "oci_subnets" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id  = var.default_compartment_id
  vcn_id                  = oci_core_vcn.this.id
  vcn_cidr                = oci_core_vcn.this.cidr_block
  
  subnets = {}
}
```

The above example won't actually deploy any subnets (because the *subnets* attribute is an empty map), however if you populate this map with entries (keys = name, values = subnet attributes), subnets would be deployed.

## Accessing the Solution

This is a core service module that is foundational to many other resources in OCI, so there is really nothing to directly access.

## Summary

This serves as a foundational component in an OCI environment, providing the ability to provision subnets as-needed OCI.

## Notes/Issues

* Note that if you provide any single element in the different resource maps (`subnets`), you must provide all of them.  Maps do not have a notion of an optional (or default value) for keys within the map, requiring that all keys/values be passed (if one key is passed, all keys must be passed).

## URLs

* Nothing at this time

## Contributing

This project is open source. Oracle appreciates any contributions that are made by the open source community.

## License

Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

Licensed under the Universal Permissive License 1.0 or Apache License 2.0.

See [LICENSE](LICENSE.txt) for more details.
