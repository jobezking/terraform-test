data "google_compute_instance" "example"{
    name="gcelab2"
}

output "zone" {
    value = data.google_compute_instance.example.zone
}