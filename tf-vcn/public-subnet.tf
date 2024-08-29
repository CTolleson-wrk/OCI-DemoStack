# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-public-subnet"{

  # Required
  compartment_id = "<ocid1.tenancy.oc1..aaaaaaaazuk73qykn6pwt6duims3z3hlml3wfwhwq7cud63ihhbdvc3ojd4a"
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.0.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  security_list_ids = [oci_core_security_list.public-security-list.id]
  display_name = "public-subnet"
}
