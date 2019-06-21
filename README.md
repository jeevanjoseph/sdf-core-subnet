# Oracle Cloud Infrastructure Network Terraform Module

## Introduction

This module provides the initial bootstrapping needed to build a new Virtual Cloud Network (VCN) and other optional services in Oracle Cloud Infrastructure (OCI).

## Solution

A VCN is the core foundation of a network in OCI.  This module provides the ability to create the following:

| Resource | Created by Default? |
|---|---|
| VCN | Yes |
| VCN-wide Security List | Yes (optional) |
| Internet Gateway | No (optional) |
| NAT Gateway | No (optional) |
| Service Gateway | No (optional) |
| Dynamic Routing Gateway | No (optional) |
| Bastion | No (optional) |

By using this module, a basic cloud network will be created, including the basic foundational communication paths (for most use-cases, though not all).  For situations where VPN-connect, FastConnect or VCN Peering is needed, these services will need to be built on top of the VCN deployed by this module.

### Resource-specific inputs

#### VCN

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| default\_compartment\_id | string | yes | none | string of the compartment OCID | This is the default OCID that will be used when creating objects (unless overridden for any specific object).  This needs to be the OCID of a pre-existing compartment (it will not create the compartment. |
| vcn\_options | map | no | see below | see below | The optional parameters that can be used to customize the VCN. |

Note that as the VCN is created, the default resources (Route Table, Security List and DHCP Options) are left as-is (not modified in any way).  Often these resources are not used (intended to serve as a black-hole, requiring the use of explicitly-defined resources).  See the documentation around [Default Resources](https://www.terraform.io/docs/providers/oci/guides/managing_default_resources.html), [Default Components that Come With Your VCN](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/overview.htm#default) and [default Security Lists](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm#default-list) for more information.

**vcn_options**

The `vcn_options` attribute is an optional map attribute.  Note that if this attribute is used, all keys/values must be specified (Terraform does not allow for default or optional map keys/values).  It has the following defined keys (and default values):

| Key | Data Type | Default Value | Valid Values | Description |
|---|---|---|---|---|
| display\_name | string | "vcn" | Any name acceptable to the OCI API. | Used to define a specific name for your VCN. |
| compartment\_id | string | null | Compartment OCID | Pre-existing compartment OCID (if default compartment is not to be used).  If this value is null, the default compartment OCID will be used. |
| cidr | string | "10.0.0.0/16" | IPv4 CIDR | Specify the IPv4 CIDR to be used for the VCN. |
| dns\_label | string | "vcn" | Valid DNS name. | Specify the DNS label to be used for the VCN.  If this value is null, DNS will be disabled for the VCN. |

Example:

```
module "oci_network" {
  ... /snip - shortened for brevity...

  vcn_options = {
    display_name      = "Module test"
    cidr              = "10.0.0.0/24"
    dns_label         = "testvcn"
    compartment_id    = null
  }
}
```

The above example will create a VCN with a CIDR of 10.0.0.0/24, display name of *Module test*, DNS label of *testvcn* and use the default compartment OCID (not shown in the above example).

#### Internet Gateway (IGW)

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| create\_igw | bool | no | false | true/false | Whether or not a IGW should be created in the VCN. |
| igw\_options | map | no | see below | see below | The optional parameters that can be used to customize the IGW. |

**igw_options**

The `igw_options` attribute is an optional map attribute.  Note that if this attribute is used, all keys/values must be specified (Terraform does not allow for default or optional map keys/values).  It has the following defined keys (and default values):

| Key | Data Type | Default Value | Valid Values | Description |
|---|---|---|---|---|
| display\_name | string | "igw" | Any name acceptable to the OCI API. | Used to define a specific name for your IGW. |
| compartment\_id | string | null | Compartment OCID | Pre-existing compartment OCID (if default compartment is not to be used).  If this value is null, the default compartment OCID will be used. |
| enabled | bool | true | true/false | Whether or not the IGW should be enabled. |

Example:

```
module "oci_network" {
  ... /snip - shortened for brevity...

  igw_options = {
    display_name     = "my_igw"
    compartment_id   = null
    enabled          = false
  }
}
```

The above example will create a IGW (enabled) in the VCN with a display name of *my_igw* and use the default compartment OCID (not shown in the above example).

#### NAT Gateway (NATGW)

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| create\_natgw | bool | no | false | true/false | Whether or not a NATGW should be created in the VCN. |
| natgw\_options | map | no | see below | see below | The optional parameters that can be used to customize the NATGW. |

**natgw_options**

The `natgw_options` attribute is an optional map attribute.  Note that if this attribute is used, all keys/values must be specified (Terraform does not allow for default or optional map keys/values).  It has the following defined keys (and default values):

| Key | Data Type | Default Value | Valid Values | Description |
|---|---|---|---|---|
| display\_name | string | "natgw" | Any name acceptable to the OCI API. | Used to define a specific name for your IGW. |
| compartment\_id | string | null | Compartment OCID | Pre-existing compartment OCID (if default compartment is not to be used).  If this value is null, the default compartment OCID will be used. |
| block\_traffic | bool | false | true/false | Whether or not the NATGW should block traffic. |

Example:

```
module "oci_network" {
  ... /snip - shortened for brevity...

  natgw_options = {
    display_name     = "my_natgw"
    compartment_id   = null
    block_traffic    = false
  }
}
```

The above example will create a NATGW in the VCN with a display name of *my_natgw*, it will not block traffic and will use the default compartment OCID (not shown in the above example).

#### Service Gateway (SVCGW)

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| create\_svcgw | bool | no | false | true/false | Whether or not a SVCGW should be created in the VCN. |
| svcgw\_options | map | no | see below | see below | The optional parameters that can be used to customize the SVCGW. |

**svcgw_options**

The `svcgw_options` attribute is an optional map attribute.  Note that if this attribute is used, all keys/values must be specified (Terraform does not allow for default or optional map keys/values).  It has the following defined keys (and default values):

| Key | Data Type | Default Value | Valid Values | Description |
|---|---|---|---|---|
| display\_name | string | "svcgw" | Any name acceptable to the OCI API. | Used to define a specific name for your SVCGW. |
| compartment\_id | string | null | Compartment OCID | Pre-existing compartment OCID (if default compartment is not to be used).  If this value is null, the default compartment OCID will be used. |
| services | list(string) | null | The OCID(s) of any valid OCI service gateway service(s). | Provide the service that should be permitted by the Service Gateway.  Use the `svcgw_services` module output for a list of services in the region (see below for an example of this). |

Example:

```
module "oci_network" {
  ... /snip - shortened for brevity...

  svcgw_options = {
    display_name      = "my_svcgw"
    compartment_id    = null
    services          = [
      module.oci_network.svcgw_services.0.id
    ]
  }
}
```

The above example will create a SVCGW in the VCN with a display name of *my_svcgw*, use the default compartment OCID (not shown in the above example) and will use the first service in the list of services available in the region.

#### Dynamic Routing Gateway (DRG)

| Attribute | Data Type | Required | Default Value | Valid Values | Description |
|---|---|---|---|---|---|
| create\_drg | bool | no | false | true/false | Whether or not a DRG should be created in the VCN. |
| drg\_options | map | no | see below | see below | The optional parameters that can be used to customize the DRG. |

**drg_options**

The `drg_options` attribute is an optional map attribute.  Note that if this attribute is used, all keys/values must be specified (Terraform does not allow for default or optional map keys/values).  It has the following defined keys (and default values):

| Key | Data Type | Default Value | Valid Values | Description |
|---|---|---|---|---|
| display\_name | string | "drg" | Any name acceptable to the OCI API. | Used to define a specific name for your DRG. |
| compartment\_id | string | null | Compartment OCID | Pre-existing compartment OCID (if default compartment is not to be used).  If this value is null, the default compartment OCID will be used. |
| route\_table\_id | string | null | The OCID of any valid, pre-existing OCI Route Table. | This is optional, but in cases where a Route Table association is desired (with the DRG), it's the place to establish this association. |

Example:

```
module "oci_network" {
  ... /snip - shortened for brevity...

  drg_options = {
    display_name     = "my_drg"
    compartment_id   = null
    route_table_id   = null
  }
}
```

The above example will create a SVCGW in the VCN with a display name of *my_drg*, use the default compartment OCID (not shown in the above example) and will not associate any Route Table with the DRG.

### Outputs

Each discrete resource that's created by the module will be exported, allowing for access to all returned attributes for the resource.  Here are the different outputs:

| Resource | Always returned? | Description |
|---|---|---|
| vcn | yes | The VCN resource that has been created by the module. |
| igw | no* | The IGW resource created by the module (if it was requested/created). |
| natgw | no* | The NATGW resource created by the module (if it was requested/created). |
| svcgw | no* | The SVCGW resource created by the module (if it was requested/created). |
| svcgw\_services | yes | The services available that can be used. |
| drg | no* | The DRG and DRGAttachment resources created by the module (if it was requested/created).  Note that the DRG is accessible via drg.drg, and DRGAttachment via drg.drg_attachment. |

*only returned when the resource has been requested to be created.

Note that you may still reference the outputs (even if they're not returned) without causing an error in Terraform (it must be smart enough to know not to throw an error in these cases).

## Getting Started

A fully-functional example has been provided in the `examples` directory.  For a quick-start guide, at minimum, you need the following (for the most basic deployment):

```
module "oci_network" {
  source           = "../../"
  #source          = "oracle-terraform-modules/default-vcn/oci"
  
  default_compartment_id = "${var.compartment_id}"
}
```

This will deploy a VCN using the module defaults (see below for a detailed description of this).

## Accessing the Solution

This is a core service module, so there is not much to directly access (except the bastion, if it's been requested to be created as a part of the solution).

You may continue to manage the environment using Terraform (ideal), OCI CLI, OCI console (UI), directly via the API, etc.

## Summary

This serves as a foundational component in an OCI environment, providing the basic network infrastructure needed within OCI.

## Notes/Issues

* Note that if you provide any single element in the different resource maps (`vcn_options`, `igw_options`, etc), you must provide all of them.  Maps do not have a notion of an optional (or default value) for keys within the map, requiring that all keys/values be passed (if one key is passed, all keys must be passed).

## URLs

* [https://www.terraform.io/docs/providers/oci/guides/managing_default_resources.html](https://www.terraform.io/docs/providers/oci/guides/managing_default_resources.html)
* [https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm#default-list](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/securitylists.htm#default-list)
* [https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/overview.htm#default](https://docs.cloud.oracle.com/iaas/Content/Network/Concepts/overview.htm#default)


## Contributing

This project is open source. Oracle appreciates any contributions that are made by the open source community.

## License

Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.

Licensed under the Universal Permissive License 1.0 or Apache License 2.0.

See [LICENSE](LICENSE.txt) for more details.
