resource "oci_core_dhcp_options" "dev-dns-custom" {
  compartment_id = var.compartment_id
  vcn_id = modules.prod_oci_network.vcn.id
  display_name = "custom_forwarders"

  // required
  options {
    type = "DomainNameServer"
    server_type = "CustomDnsServer"
    custom_dns_servers = [ "172.16.0.2","172.16.0.3" ]
  }

  options {
    type = "SearchDomain"
    search_domain_names = [ "vcn1.oraclevcn.com" ]
  }
}
resource "oci_core_dhcp_options" "dev-dns-vcn" {
  compartment_id = var.compartment_id
  vcn_id = modules.prod_oci_network.vcn.id
  display_name = "vcn"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type = "SearchDomain"
    search_domain_names = [ "vcn1.oraclevcn.com" ]
  }
}