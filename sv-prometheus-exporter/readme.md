# Virtual Service for Generating Prometheus Metrics of SV Server Runtime

## Usage

The virtual service is supposed to be deployed on SV Server. Preferrably on its own agent to signify it does not belong to regular production virtual services.

Base URI: `metrics`
   
Example URL:

http://localhost:6077/metrics

Example output:
```
# HELP sv_server_info SV info
# TYPE sv_server_info gauge
sv_server_info{version="5.9.0.1616"} 1
# HELP sv_server_cpu_utilization_ratio CPU utilization percentage
# TYPE sv_server_cpu_utilization_ratio gauge
sv_server_cpu_utilization_ratio 0.05
# HELP sv_server_memory_utilization_ratio Memory utilization percentage
# TYPE sv_server_memory_utilization_ratio gauge
sv_server_memory_utilization_ratio 0.49
# HELP sv_server_db_response_time_seconds Database response time in seconds
# TYPE sv_server_db_response_time_seconds gauge
sv_server_db_response_time_seconds 0.0209206
# HELP sv_server_sv_server_warnings_total SV Server warnings count
# TYPE sv_server_sv_server_warnings_total counter
sv_server_sv_server_warnings_total 96
# HELP sv_server_sv_server_errors_total SV Server errors count
# TYPE sv_server_sv_server_errors_total counter
sv_server_sv_server_errors_total 410
# HELP sv_server_tps Current transactions per second across all virtual services
# TYPE sv_server_tps gauge
sv_server_tps 1
# HELP sv_server_response_time_seconds_avg Current response time average across all virtual services
# TYPE sv_server_response_time_seconds_avg gauge
sv_server_response_time_seconds_avg 0
# HELP sv_server_data_throughput_bytes_per_second Current SV Server data throughput in bytes
# TYPE sv_server_data_throughput_bytes_per_second gauge
sv_server_data_throughput_bytes_per_second 2689
# HELP sv_server_client_hosts_count Current count of remotely connected hosts (machines)
# TYPE sv_server_client_hosts_count gauge
sv_server_client_hosts_count 1
# HELP sv_server_message_size_bytes_avg Message size average across all virtual services
# TYPE sv_server_message_size_bytes_avg gauge
sv_server_message_size_bytes_avg 2689
# HELP sv_vs_data_simulation_accuracy_ratio Data simulation accuracy percentage
# TYPE sv_vs_data_simulation_accuracy_ratio gauge
sv_vs_data_simulation_accuracy_ratio{name="sv-prometheus-exporter"} 1
# HELP sv_vs_performance_simulation_accuracy_ratio Performance simulation accuracy percentage
# TYPE sv_vs_performance_simulation_accuracy_ratio gauge
sv_vs_performance_simulation_accuracy_ratio{name="sv-prometheus-exporter"} 1
# HELP sv_vs_data_throughput_bytes_per_second Current data throughput in bytes/s
# TYPE sv_vs_data_throughput_bytes_per_second gauge
sv_vs_data_throughput_bytes_per_second{name="sv-prometheus-exporter"} 2689
# HELP sv_vs_tps Current virtual service transactions per second
# TYPE sv_vs_tps gauge
sv_vs_tps{name="sv-prometheus-exporter"} 1
# HELP sv_vs_response_time_seconds_avg Current virtual response time average in seconds
# TYPE sv_vs_response_time_seconds_avg gauge
sv_vs_response_time_seconds_avg{name="sv-prometheus-exporter"} 0.55
```

## Changelog

2023-11-27
Initial version