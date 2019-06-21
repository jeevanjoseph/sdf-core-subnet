
######################
# Availability Domains
######################
data "oci_identity_availability_domains" "this" {
  compartment_id = var.default_compartment_id
}
