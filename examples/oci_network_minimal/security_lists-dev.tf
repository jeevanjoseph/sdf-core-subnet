resource "oci_core_security_list" "dev-vcn_wide" {
  provider = "oci.phx"
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "dns1"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "Dev-SL_1" {
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "Dev-SL_1"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "Dev-SL_2" {
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "Dev-SL_2"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "Dev-SL_3" {
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "Dev-SL_3"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "web_1-1" {
  provider = "oci.phx"
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "web_1-1"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "web_1-2" {
  provider = "oci.phx"
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "web_1-2"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "web_1-3" {
  provider = "oci.phx"
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "web_1-3"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "dmz_1-1" {
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "dmz_1-1"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "dmz_1-2" {
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "dmz_1-2"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}

resource "oci_core_security_list" "dmz_1-3" {
  compartment_id = "${oci_identity_compartment.tim_test.id}"
  vcn_id = "${oci_core_virtual_network.vcn1.id}"
  display_name = "dmz_1-3"

  ingress_security_rules {
    protocol = "all"
    source_type = "CIDR_BLOCK"
    source = "192.168.0.0/24"
    stateless = false
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.0/24"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.16/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 80
      max = 80
    }
  }
  ingress_security_rules {
    stateless = true
    protocol  = "6"
    source      = "10.0.0.32/28"
    source_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.0/24"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 22
      max = 22
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.16/28"
    destination_type = "CIDR_BLOCK"
    source_port = null
    destination_port = {
      min = 80
      max = 80
    }
  }
  egress_security_rules {
    stateless = true
    protocol  = "6"
    destination      = "10.0.0.32/28"
    destination_type = "CIDR_BLOCK"
    source_port = {
      min = 55000
      max = 65535
    }
    destination_port = {
      min = 80
      max = 80
    }
  }
}
