variable "kubectl_executable_name" {}

variable "haystack_cluster_name" {
  default = "haystack"
}

# ========================================
# Haystack
# ========================================

# traces config
variable "traces" {
  type = "map"
  default = {
    enabled = true
    version = "316f53fb22b01984099db5c2b99049b703483082"
    indexer_instances = 1
    indexer_environment_overrides = ""
    indexer_cpu_request = "100m"
    indexer_cpu_limit = "1000m"
    indexer_memory_request = "250"
    indexer_memory_limit = "250"
    indexer_jvm_memory_limit = "200"
    indexer_elasticsearch_template = "{\"template\":\"haystack-traces*\",\"settings\":{\"number_of_shards\":4,\"index.mapping.ignore_malformed\":true,\"analysis\":{\"normalizer\":{\"lowercase_normalizer\":{\"type\":\"custom\",\"filter\":[\"lowercase\"]}}}},\"aliases\":{\"haystack-traces\":{}},\"mappings\":{\"spans\":{\"_field_names\":{\"enabled\":false},\"_all\":{\"enabled\":false},\"_source\":{\"includes\":[\"traceid\"]},\"properties\":{\"traceid\":{\"enabled\":false},\"starttime\":{\"type\":\"long\",\"doc_values\": true},\"spans\":{\"type\":\"nested\",\"properties\":{\"servicename\":{\"type\":\"keyword\",\"normalizer\":\"lowercase_normalizer\",\"doc_values\":false,\"norms\":false},\"operationname\":{\"type\":\"keyword\",\"normalizer\":\"lowercase_normalizer\",\"doc_values\":false,\"norms\":false},\"starttime\":{\"enabled\":false}}}},\"dynamic_templates\":[{\"strings_as_keywords_1\":{\"match_mapping_type\":\"string\",\"mapping\":{\"type\":\"keyword\",\"normalizer\":\"lowercase_normalizer\",\"doc_values\":false,\"norms\":false}}},{\"longs_disable_doc_norms\":{\"match_mapping_type\":\"long\",\"mapping\":{\"type\":\"long\",\"doc_values\":false,\"norms\":false}}}]}}}"

    reader_instances = 1
    reader_environment_overrides = ""
    reader_cpu_request = "100m"
    reader_cpu_limit = "1000m"
    reader_memory_request = "250"
    reader_memory_limit = "250"
    reader_jvm_memory_limit = "200"

    backend_cpu_request = "100m"
    backend_cpu_limit = "500m"
    backend_memory_request = "250"
    backend_memory_limit = "250"
    backend_jvm_memory_limit = "200"
  }
}

variable "trends" {
  type = "map"
  default = {
    enabled = true
    version = "1.1"
    metricpoint_encoder_type = "periodreplacement"
    span_timeseries_transformer_instances = 1
    span_timeseries_transformer_cpu_request = "100m"
    span_timeseries_transformer_cpu_limit = "1000m"
    span_timeseries_transformer_memory_request = "250"
    span_timeseries_transformer_memory_limit = "250"
    span_timeseries_transformer_jvm_memory_limit = "200"
    span_timeseries_transformer_environment_overrides = ""

    timeseries_aggregator_instances = 1
    timeseries_aggregator_environment_overrides = ""
    timeseries_aggregator_cpu_request = "100m"
    timeseries_aggregator_cpu_limit = "1000m"
    timeseries_aggregator_memory_request = "250"
    timeseries_aggregator_memory_limit = "250"
    timeseries_aggregator_jvm_memory_limit = "200"
  }
}

variable "pipes" {
  type = "map"
  default = {
    version = "a20a8087f5ddc3fbf1a1c72dcff840608accadbf"

    firehose_kafka_threadcount = 1
    firehose_writer_enabled = false
    firehose_writer_environment_overrides = ""
    firehose_writer_firehose_initialretrysleep = 1
    firehose_writer_firehose_maxretrysleep = ""
    firehose_writer_firehose_signingregion = ""
    firehose_writer_firehose_streamname = ""
    firehose_writer_firehose_totopic = ""
    firehose_writer_firehose_url = ""
    firehose_writer_haystack_kafka_fromtopic = ""
    firehose_writer_instances = 1
    firehose_writer_cpu_request = "100m"
    firehose_writer_cpu_limit = "500m"
    firehose_writer_memory_request = "250"
    firehose_writer_memory_limit = "250"
    firehose_writer_jvm_memory_limit = "200"

    http_poster_enabled = false
    http_poster_environment_overrides = ""
    http_poster_httppost_pollpercent = ""
    http_poster_httppost_url = ""
    http_poster_instances = 1
    http_poster_cpu_request = "100m"
    http_poster_cpu_limit = "500m"
    http_poster_memory_request = "250"
    http_poster_memory_limit = "250"
    http_poster_jvm_memory_limit = "200"

    json_transformer_enabled = false
    json_transformer_environment_overrides = ""
    json_transformer_instances = 1
    json_transformer_cpu_request = "100m"
    json_transformer_cpu_limit = "500m"
    json_transformer_memory_request = "250"
    json_transformer_memory_limit = "250"
    json_transformer_jvm_memory_limit = "200"

    kafka_producer_enabled = false
    kafka_producer_environment_overrides = ""
    kafka_producer_instances = 1
    kafka_producer_cpu_request = "100m"
    kafka_producer_cpu_limit = "500m"
    kafka_producer_memory_request = "250"
    kafka_producer_memory_limit = "250"
    kafka_producer_jvm_memory_limit = "200"

    secret_detector_enabled = false
    secret_detector_environment_overrides = ""
    secret_detector_instances = 1
    secret_detector_kafka_threadcount = 1
    secret_detector_secretsnotifications_email_from = ""
    secret_detector_secretsnotifications_email_host = ""
    secret_detector_secretsnotifications_email_subject = ""
    secret_detector_secretsnotifications_email_tos = ""
    secret_detector_secretsnotifications_whitelist_bucket = ""
    secret_detector_cpu_request = "100m"
    secret_detector_cpu_limit = "500m"
    secret_detector_memory_request = "250"
    secret_detector_memory_limit = "250"
    secret_detector_jvm_memory_limit = "200"
  }
}

variable "collector" {
  type = "map"
  default = {
    version = "1.1"
    kinesis_span_collector_instances = 1
    kinesis_span_collector_enabled = false
    kinesis_stream_region = ""
    kinesis_stream_name = ""
    kinesis_span_collector_sts_role_arn = ""
    kinesis_span_collector_environment_overrides = ""
    kinesis_span_collector_cpu_request = "100m"
    kinesis_span_collector_cpu_limit = "1000m"
    kinesis_span_collector_memory_request = "250"
    kinesis_span_collector_memory_limit = "250"
    kinesis_span_collector_jvm_memory_limit = "200"


    http_span_collector_instances = 1
    http_span_collector_enabled = false
    http_span_collector_environment_overrides = ""
    http_span_collector_cpu_request = "100m"
    http_span_collector_cpu_limit = "1000m"
    http_span_collector_memory_request = "250"
    http_span_collector_memory_limit = "250"
    http_span_collector_jvm_memory_limit = "200"
  }
}

variable "service-graph" {
  type = "map"
  default = {
    enabled = false
    version = "1.0"
    metricpoint_encoder_type = "base64"
    node_finder_instances = 1
    node_finder_environment_overrides = ""
    node_finder_cpu_request = "100m"
    node_finder_cpu_limit = "1000m"
    node_finder_memory_request = "250"
    node_finder_memory_limit = "250"
    node_finder_jvm_memory_limit = "200"
    collect_tags = "[]"

    graph_builder_instances = 1
    graph_builder_environment_overrides = ""
    graph_builder_cpu_request = "100m"
    graph_builder_cpu_limit = "1000m"
    graph_builder_memory_request = "250"
    graph_builder_memory_limit = "250"
    graph_builder_jvm_memory_limit = "200"
  }
}

variable "ui" {
  type = "map"
  default = {
    enabled = true
    version = "1.1"
    instances = 1
    whitelisted_fields = ""
    enable_sso = false
    saml_callback_url = ""
    saml_entry_point = ""
    saml_issuer = ""
    session_secret = ""
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    metricpoint_encoder_type = "base64"
  }
}

variable "metrictank" {
  type = "map"
  default = {
    instances = 1,
    environment_overrides = ""
    tag_support = "true"
    external_kafka_broker_hostname = ""
    external_kafka_broker_port = 9092
    external_hostname = ""
    external_port = 6060
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
  }
}

variable "haystack-alerts" {
  type = "map"
  default = {
    enabled = false
    es_curator_enabled = false
    version = "4c0bb47b0cd04ab9234befcdef3ad5710ea183f3"
    elasticsearch_template = "{\"template\": \"haystack-anomalies*\",\"settings\": {\"number_of_shards\": 1,\"index.mapping.ignore_malformed\": true,\"analysis\": {\"normalizer\": {\"lowercase_normalizer\": {\"type\": \"custom\",\"filter\": [\"lowercase\"]}}}},\"mappings\": {\"anomaly\": {\"_source\": {\"enabled\": true},\"_field_names\": {\"enabled\": false},\"_all\": {\"enabled\": false},\"properties\": {\"startTime\": {\"type\": \"long\",\"doc_values\": true}},\"dynamic_templates\": [{\"strings_as_keywords_1\": {\"match_mapping_type\": \"string\",\"mapping\": {\"type\": \"keyword\",\"normalizer\": \"lowercase_normalizer\",\"doc_values\": false,\"norms\": false}}}, {\"longs_disable_doc_norms\": {\"match_mapping_type\": \"long\",\"mapping\": {\"type\": \"long\",\"doc_values\": false,\"norms\": false}}}]}}}"
    alert-api_instances = 1
    alert-api_environment_overrides = ""
    alert-api_cpu_request = "100m"
    alert-api_cpu_limit = "1000m"
    alert-api_memory_request = "250"
    alert-api_memory_limit = "250"
    alert-api_jvm_memory_limit = "200"
    subscription_service_hostname = "http://alert-manager-service.aa-apps.svc.cluster.local"
    subscription_service_port = 8080

    anomaly-store_instances = 1
    anomaly-store_environment_overrides = ""
    anomaly-store_cpu_request = "100m"
    anomaly-store_cpu_limit = "1000m"
    anomaly-store_memory_request = "250"
    anomaly-store_memory_limit = "250"
    anomaly-store_jvm_memory_limit = "200"
  }
}

# ========================================
# Adaptive Alerting
# ========================================

variable "alerting" {
  type = "map"
  default = {
    version = "ecca91efc7b51d45c21aaaf04a72f45bd83f99eb"
  }
}

variable "modelservice" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    db_endpoint = ""
  }
}

variable "ad-mapper" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/adaptive-alerting-ad-mapper:ecca91efc7b51d45c21aaaf04a72f45bd83f99eb"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    jvm_memory_limit = "200"
    environment_overrides = ""
    modelservice_uri_template = "http://modelservice/api/detectors/search/findByMetricHash?hash=%s"
    kafka_hostname = "kafka-service.haystack-apps.svc.cluster.local"
  }
}

variable "ad-manager" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/adaptive-alerting-ad-manager:ecca91efc7b51d45c21aaaf04a72f45bd83f99eb"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "250"
    memory_limit = "250"
    jvm_memory_limit = "200"
    environment_overrides = ""
    aquila_uri = "http://aquila-detector/detect"
    models_region = "us-west-2"
    models_bucket = "aa-models"
    modelservice_uri_template = "http://modelservice/api/models/search/findLatestByDetectorUuid?uuid=%s"
    kafka_hostname = "kafka-service.haystack-apps.svc.cluster.local"
  }
}

variable "notifier" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    webhook_url = ""
  }
}

# ========================================
# Aquila
# ========================================

# TODO Figure out how to isolate and DRY the Aquila version in the config below. [WLW]
# https://github.com/hashicorp/terraform/issues/4084

# Override image and image_pull_policy to use Minikube-local images. See
# https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube

variable "aquila-detector" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/aquila-detector:ecca91efc7b51d45c21aaaf04a72f45bd83f99eb"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
  }
}

variable "aquila-trainer" {
  type = "map"

  # I removed the app name from the keys here, as the keys are already app-scoped.
  # It's easier to use this as a template for future apps. Please consider adopting
  # this approach for the other apps. [WLW]
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/aquila-trainer:ecca91efc7b51d45c21aaaf04a72f45bd83f99eb"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
  }
}

# ========================================
# Alert Manager
# ========================================

variable "alert-manager" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/alert-manager-deprecated:f5bd3989f0c06b250a7bdaa29c27b858daf7231f"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    db_endpoint = ""
    smtp_host = ""
    mail_from = ""
  }
}

variable "alert-manager-service" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/alert-manager-service:a66980da8d644fd08d2c86699c474437fc16ceff"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    es_urls = ""
  }
}

variable "alert-manager-store" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/alert-manager-store:a66980da8d644fd08d2c86699c474437fc16ceff"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    es_urls = ""
  }
}

variable "alert-manager-notifier" {
  type = "map"
  default = {
    enabled = false
    instances = 1
    image = "expediadotcom/alert-manager-notifier:a66980da8d644fd08d2c86699c474437fc16ceff"
    image_pull_policy = "IfNotPresent"
    cpu_request = "100m"
    cpu_limit = "1000m"
    memory_request = "500"
    memory_limit = "500"
    jvm_memory_limit = "300"
    environment_overrides = ""
    subscription_search_url = ""
    mail_from = ""
  }
}


