resource "google_bigquery_dataset" "bigquery_dataset" {
  dataset_id = var.bigquery_dataset
}

resource "google_bigquery_table" "bigquery_table" {
  dataset_id = google_bigquery_dataset.bigquery_dataset.dataset_id
  table_id   = var.bigquery_table

  schema = <<SCHEMA
[
  {"name": "field1", "type": "STRING"},
  {"name": "field2", "type": "INTEGER"},
  {"name": "field3", "type": "TIMESTAMP"}
]
SCHEMA
}