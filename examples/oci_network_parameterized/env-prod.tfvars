region = "ca-toronto-1"

# Compartment
compartment_id = "ocid1.compartment.oc1..aaaaaaaavk6k34iezzhy7vunasm52qv5b45ewjdi4vgsybtfsqqd5rvgjena"

# VCN Configuration
vcn_name                = "Tim C - prod VCN"
vcn_cidr                = "172.16.0.0/24"
vcn_dns_label           = "prod"
vcn_compartment_id      = null

create_igw              = true
create_svcgw            = true
create_natgw            = true
create_drg              = true
create_vcn_wide_sl      = true

# SVCGW Configuration
svcgw_name              = "Prod_SVCGW"
svcgw_compartment_id    = null
svcgw_service_ids       = [module.oci_network.svcgw_services.0.id]

# NATGW Configuration
natgw_name              = "Prod_NATGW"
natgw_compartment_id    = null
natgw_block_traffic     = false

# IGW Configuration
igw_name                = "Prod_IGW"
igw_compartment_id      = null
igw_enabled             = true

# DRG Configuration
drg_name                = "Prod_DRG"
drg_compartment_id      = null
drg_route_table_id      = null

# VCN-wide SL
vcn_wide_sl_options     = {
  display_name   = "prod-SL"
  compartment_id = null
  ingress_rules = null
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}

# Subnets
subnet1_name            = "Servers-priv"
subnet1_compartment_id  = null
subnet1_cidr            = "172.16.0.0/28"
subnet1_create_rt       = true
subnet1_rt_id           = null
subnet1_rt_rules        = {
  display_name          = "my_rt_1"
  compartment_id        = null
  route_rules           = [
    {
      dst_cidr          = "10.0.0.0/16"
      dst_object_id     = "my.ocid.igw.123143425"
    },
    {
      dst_cidr          = "10.0.0.0/8"
      dst_object        = "vcn_drg"
    },
    {
      dst_cidr          = "192.168.0.0/16"
      dst_object        = "vcn_svcgw"
    },
    {
      dst_cidr          = "172.16.0.0/12"
      dst_object        = "my.ocid.privateip.1234567"
    }
  ]
}
subnet1_dhcp_options_create = true
subnet1_dhcp_options_type = "custom"
subnet1_dhcp_forwarders = ["172.16.0.2", "172.16.0.3"]
subnet1_dhcp_domain_name = "timtest.oraclevcn.com"
subnet1_use_vcn_wide_sl = true
subnet1_sl2             = {
  display_name   = "prod-SL_1"
  compartment_id = null
  ingress_rules = null
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}
subnet1_sl3             = {
  display_name   = "prod-SL_2"
  compartment_id = null
  ingress_rules = [
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.0/24"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      src_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.16/28"
      src_type = "CIDR_BLOCK"
      src_port = null
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.32/28"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}
subnet1_sl4             = {
  display_name   = "prod-SL_3"
  compartment_id = null
  ingress_rules = [
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.0/24"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      src_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.16/28"
      src_type = "CIDR_BLOCK"
      src_port = null
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.32/28"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}

subnet2_name            = "web_1"
subnet2_compartment_id  = null
subnet2_cidr            = "172.16.0.16/28"
subnet2_create_rt       = true
subnet2_rt_id           = null
subnet2_rt_rules        = {
  display_name          = "web_1"
  compartment_id        = null
  route_rules           = [
    {
      dst_cidr          = "10.0.0.0/16"
      dst_object_id     = "my.ocid.igw.123143425"
    },
    {
      dst_cidr          = "10.0.0.0/8"
      dst_object        = "vcn_drg"
    },
    {
      dst_cidr          = "192.168.0.0/16"
      dst_object        = "vcn_svcgw"
    },
    {
      dst_cidr          = "172.16.0.0/12"
      dst_object        = "my.ocid.privateip.1234567"
    }
  ]
}
subnet2_dhcp_options_create = true
subnet2_dhcp_options_type = "custom"
subnet2_dhcp_forwarders = ["172.16.0.2", "172.16.0.3"]
subnet2_dhcp_domain_name = "timtest.oraclevcn.com"
subnet2_use_vcn_wide_sl = true
subnet2_sl2             = {
  display_name   = "web_1-1"
  compartment_id = null
  ingress_rules = null
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}
subnet2_sl3             = {
  display_name   = "web_1-2"
  compartment_id = null
  ingress_rules = [
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.0/24"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      src_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.16/28"
      src_type = "CIDR_BLOCK"
      src_port = null
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.32/28"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}
subnet2_sl4             = {
  display_name   = "web_1-3"
  compartment_id = null
  ingress_rules = [
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.0/24"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      src_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.16/28"
      src_type = "CIDR_BLOCK"
      src_port = null
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.32/28"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}

subnet3_name            = "dmz_1"
subnet3_compartment_id  = null
subnet3_cidr            = "172.16.0.32/28"
subnet3_create_rt       = true
subnet3_rt_id           = null
subnet3_rt_rules        = {
  display_name          = "dmz_1"
  compartment_id        = null
  route_rules           = [
    {
      dst_cidr          = "10.0.0.0/16"
      dst_object_id     = "my.ocid.igw.123143425"
    },
    {
      dst_cidr          = "10.0.0.0/8"
      dst_object        = "vcn_drg"
    },
    {
      dst_cidr          = "192.168.0.0/16"
      dst_object        = "vcn_svcgw"
    },
    {
      dst_cidr          = "172.16.0.0/12"
      dst_object        = "my.ocid.privateip.1234567"
    }
  ]
}
subnet3_dhcp_options_create = true
subnet3_dhcp_options_type = "custom"
subnet3_dhcp_forwarders = ["172.16.0.2", "172.16.0.3"]
subnet3_dhcp_domain_name = "timtest.oraclevcn.com"
subnet3_use_vcn_wide_sl = true
subnet3_sl2             = {
  display_name   = "dmz_1-1"
  compartment_id = null
  ingress_rules = null
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}
subnet3_sl3             = {
  display_name   = "dmz_1-2"
  compartment_id = null
  ingress_rules = [
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.0/24"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      src_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.16/28"
      src_type = "CIDR_BLOCK"
      src_port = null
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.32/28"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}
subnet3_sl4             = {
  display_name   = "dmz_1-3"
  compartment_id = null
  ingress_rules = [
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.0/24"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      src_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.16/28"
      src_type = "CIDR_BLOCK"
      src_port = null
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      src      = "10.0.0.32/28"
      src_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      src_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
  egress_rules = [
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.0/24"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 22
        max = 22
      }
      dst_port = null
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.16/28"
      dst_type = "CIDR_BLOCK"
      src_port = null
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    },
    {
      stateless = true
      protocol  = "6"
      dst      = "10.0.0.32/28"
      dst_type = "CIDR_BLOCK"
      src_port = {
        min = 55000
        max = 65535
      }
      dst_port = {
        min = 80
        max = 80
      }
      icmp_type = null
      icmp_code = null
    }
  ]
}