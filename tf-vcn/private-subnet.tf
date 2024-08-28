# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-private-subnet"{

  # Required
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaazuk73qykn6pwt6duims3z3hlml3wfwhwq7cud63ihhbdvc3ojd4a"
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.1.0/24"
 
  # Optional
  # Caution: For the route table id, use module.vcn.nat_route_id.
  # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
  route_table_id = module.vcn.nat_route_id
  security_list_ids = [oci_core_security_list.private-security-list.id]
  display_name = "private-subnet"
}