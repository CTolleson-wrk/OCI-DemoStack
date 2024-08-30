

resource "oci_core_instance" "oracle_instance" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = "ocid1.tenancy.oc1..aaaaaaaazuk73qykn6pwt6duims3z3hlml3wfwhwq7cud63ihhbdvc3ojd4a"
  shape               = "VM.Standard.E2.1.Micro"
  source_details {
    source_id   = "ocid1.image.oc1.iad.aaaaaaaaos3mbobav5crphacln3i4vdfbukc2jgn7tgfbkf5lwpijg7rvehq"
    source_type = "image"
  }

  # Optional
  display_name = "oraclelinux"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = "ocid1.subnet.oc1.iad.aaaaaaaa4mnejkdpc3pdf4mr4kzmk5nnjsxgbvg3n32vsoxvkh4gednvbnya"
  }
  metadata = {
    ssh_authorized_keys = file("~/Oci-DemoStack/.ssh/key.pub")
  }
  preserve_boot_volume = false
}