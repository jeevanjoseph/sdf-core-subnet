provider "oci" {
    version          = ">= 3.0.0"
  tenancy_ocid     = "${var.tenancy_id}"
  user_ocid        = "${var.user_id}"
  fingerprint      = "${var.fingerprint}"
  private_key      = "${var.private_key}"
  region           = "${var.region}"
}

