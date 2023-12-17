resource "google_dataflow_job" "dataflow_job" {
  name     = "dataflow-job"
  project  = var.project_id
  region   = "your-gcp-region"

  template_gcs_path = "gs://dataflow-templates/pubsub-to-bigquery"
  temp_gcs_location = "gs://your-dataflow-temp-location"

  parameters = {
    inputTopic         = module.pubsub.pubsub_topic_name
    outputTable        = "${var.project_id}:${var.bigquery_dataset}.${var.bigquery_table}"
    write_disposition  = "WRITE_APPEND"
  }
}