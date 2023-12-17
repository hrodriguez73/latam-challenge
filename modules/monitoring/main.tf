resource "google_monitoring_dashboard" "system_dashboard" {
  display_name = "System Dashboard"
  project      = var.project_id

  grid_layout {
    widget {
      title    = "Pub/Sub Topic Message Count"
      width    = 4
      height   = 3
      x_offset = 0
      y_offset = 0
      chart {
        data_set {
          time_series_query {
            time_series_filter {
              filter = "metric.type=\"pubsub.googleapis.com/topic/message_count\" AND resource.type=\"pubsub_topic\" AND resource.label.topic_id=\"${var.pubsub_topic_name}\""
            }
          }
          y_axis_label = "Messages"
        }
        chart_options {
          mode = "COLOR_MODE_UNSPECIFIED"
          x_axis_options {
            view_window {
              min_value = "2023-01-01T00:00:00Z"
              max_value = "2023-12-31T23:59:59Z"
            }
          }
        }
      }
    }
    
    widget {
      title    = "Dataflow Job Latency"
      width    = 4
      height   = 3
      x_offset = 4
      y_offset = 0
      chart {
        data_set {
          time_series_query {
            time_series_filter {
              filter = "metric.type=\"dataflow.googleapis.com/job/total_processing_time\" AND resource.type=\"dataflow_job\" AND resource.label.job_id=\"${google_dataflow_job.dataflow_job.name}\""
            }
          }
          y_axis_label = "Milliseconds"
        }
      }
    }

    widget {
      title    = "BigQuery Table Rows"
      width    = 4
      height   = 3
      x_offset = 8
      y_offset = 0
      chart {
        data_set {
          time_series_query {
            time_series_filter {
              filter = "metric.type=\"bigquery.googleapis.com/table/num_rows\" AND resource.type=\"bigquery_table\" AND resource.label.table_id=\"${var.bigquery_table}\""
            }
          }
          y_axis_label = "Rows"
        }
      }
    }
  }
}