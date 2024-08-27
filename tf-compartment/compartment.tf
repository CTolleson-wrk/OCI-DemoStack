resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaazuk73qykn6pwt6duims3z3hlml3wfwhwq7cud63ihhbdvc3ojd4a"
    description = "Compartment for Terraform resources."
    name = "networking1"
}