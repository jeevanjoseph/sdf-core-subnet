resource "oci_core_route_table" "dev-my_rt_1" {
  compartment_id = oci_identity_compartment.tim_test.id
  vcn_id = oci_core_virtual_network.vcn1.id
  display_name = "my_rt_1"

  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "10.0.0.0/24"
    network_entity_id = oci_core_local_peering_gateway.lpg1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "192.168.0.0/16"
    network_entity_id = oci_core_internet_gateway.igw1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "172.16.0.0/12"
    network_entity_id = oci_core_local_peering_gateway.lpg1.id
  }
}

resource "oci_core_route_table" "dev-web_1" {
  compartment_id = oci_identity_compartment.tim_test.id
  vcn_id = oci_core_virtual_network.vcn1.id
  display_name = "web_1"

  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "10.0.0.0/24"
    network_entity_id = oci_core_local_peering_gateway.lpg1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "192.168.0.0/16"
    network_entity_id = oci_core_internet_gateway.igw1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "172.16.0.0/12"
    network_entity_id = oci_core_local_peering_gateway.lpg1.id
  }
}

resource "oci_core_route_table" "dev-dmz_1" {
  compartment_id = oci_identity_compartment.tim_test.id
  vcn_id = oci_core_virtual_network.vcn1.id
  display_name = "dmz_1"

  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "10.0.0.0/24"
    network_entity_id = oci_core_local_peering_gateway.lpg1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "192.168.0.0/16"
    network_entity_id = oci_core_internet_gateway.igw1.id
  }
  route_rules {
    destination_type = "CIDR_BLOCK"
    destination = "172.16.0.0/12"
    network_entity_id = oci_core_local_peering_gateway.lpg1.id
  }
}