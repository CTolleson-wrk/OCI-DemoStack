

resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "<ocid1.tenancy.oc1..aaaaaaaazuk73qykn6pwt6duims3z3hlml3wfwhwq7cud63ihhbdvc3ojd4a"
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaac3eshnn5mcmwpwnvy76lnb5wzzlr2dew4ilbb5gfealimrostriq"
        source_type = "image"
    }

    # Optional
    display_name = "ubuntuinstance"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "<subnet-ocid>"
    }
    metadata = {
        ssh_authorized_keys = file("ctolleson/oci-demostack/publickey.pub.pub")
    } 
    preserve_boot_volume = false
}