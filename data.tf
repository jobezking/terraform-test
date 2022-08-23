data "google_compute_instance" "example"{
    name="gcelab2"
}

output "zone" {
    value = data.google_compute_instance.example.zone
}

output "vm_name" {
    value = google_compute_instance.named_instance[*].name
}

output "each_vm_name" {
    value = google_compute_instance.each_instance[*].name
}