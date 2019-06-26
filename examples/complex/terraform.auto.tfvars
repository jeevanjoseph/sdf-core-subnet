# vcn_id
vcn_id = "ocid1.vcn.oc1.eu-frankfurt-1.aaaaaaaapg6nhfwkclv5muursbwj4gomror7enk2sfslr5yxviliq77awxya"

# Subnets
subnets = {
    "test1" = {
      "compartment_id"    = null
      "dynamic_cidr"      = true
      "cidr"              = null
      "cidr_len"          = 30
      "cidr_num"          = 0
      "enable_dns"        = true
      "dns_label"         = "test1"
      "private"           = "true"
      "ad"                = 0
      "dhcp_options_id"   = null
      "route_table_id"    = null
      "security_list_ids" = []
    }
    "test2" = {
      "compartment_id"   = null
      "dynamic_cidr"      = true
      "cidr"              = null
      "cidr_len"          = 30
      "cidr_num"          = 1
      "enable_dns"        = true
      "dns_label"         = "test2"
      "private"           = true
      "ad"                = 0
      "dhcp_options_id"   = null
      "route_table_id"    = null
      "security_list_ids" = null
    },
    "test3" = {
      "compartment_id"    = null
      "dynamic_cidr"      = true
      "cidr"              = null
      "cidr_len"          = 30
      "cidr_num"          = 2
      "enable_dns"        = false
      "dns_label"         = null
      "private"           = true
      "ad"                = null
      "dhcp_options_id"   = null
      "route_table_id"    = null
      "security_list_ids" = null
    },
    "test4" = {
      "compartment_id"    = null
      "dynamic_cidr"      = true
      "cidr"              = null
      "cidr_len"          = 30
      "cidr_num"          = 3
      "enable_dns"        = false
      "dns_label"         = "test4"
      "private"           = true
      "ad"                = null
      "dhcp_options_id"   = null
      "route_table_id"    = null
      "security_list_ids" = null
    },
    "test5" = {
      "compartment_id"    = null
      "dynamic_cidr"      = true
      "cidr"              = null
      "cidr_len"          = 30
      "cidr_num"          = 4
      "enable_dns"        = true
      "dns_label"         = null
      "private"           = false
      "ad"                = null
      "dhcp_options_id"   = null
      "route_table_id"    = null
      "security_list_ids" = null
    }
}