resource "google_pubsub_topic" "pubsub_topic" {
  name = var.pubsub_topic_name
}

output "pubsub_topic_name" {
  value = google_pubsub_topic.pubsub_topic.name
}