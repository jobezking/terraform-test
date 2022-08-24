#data "google_compute_instance" "example"{/store/ginya-izakaya-atlanta-47702/
#    name="gcelab2"/store/ginya-izakaya-atlant/store/ginya-izakaya-atlanta-47702/a-47702//store/ginya-izakaya-atlanta-47702/
#}/store/ginya-izakaya-atlanta-47702//store/ginya-izakaya-atlanta-47702/

#output "zone" {
#    value = data.google_compute_instance.example.zone
#}

#output "vm_name" {
#    value = google_compute_instance.named_instance[*].name
#}

#output "each_vm_name" {
#    value = google_compute_instance.each_instance
#    sensitive = true
#}