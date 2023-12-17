provider "google" {
  credentials = file("path/to/your/gcp/credentials.json")
  project     = "your-gcp-project-id"
  region      = "your-gcp-region"
}

module "pubsub" {
  source            = "./modules/pubsub"
  project_id        = "your-gcp-project-id"
  pubsub_topic_name = "your-pubsub-topic"
}

module "dataflow" {
  source            = "./modules/dataflow"
  project_id        = "your-gcp-project-id"
  pubsub_topic_name = module.pubsub.pubsub_topic_name
  bigquery_dataset  = "your-bigquery-dataset"
  bigquery_table    = "your-bigquery-table"
}

module "bigquery" {
  source           = "./modules/bigquery"
  project_id       = "your-gcp-project-id"
  bigquery_dataset = "your-bigquery-dataset"
  bigquery_table   = "your-bigquery-table"
}

module "monitoring" {
  source            = "./modules/monitoring"
  project_id        = "your-gcp-project-id"
  pubsub_topic_name = module.pubsub.pubsub_topic_name
}