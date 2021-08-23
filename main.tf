resource "aws_api_gateway_rest_api" "gateway" {
  name           = var.name
  api_key_source = var.api_key_source
  description    = var.description
  body           = var.body
  endpoint_configuration {
    types = var.types
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  description       = var.deploy_description
  stage_description = var.version_id
  rest_api_id       = aws_api_gateway_rest_api.gateway.id
  stage_name        = ""
  variables         = var.variables
}

resource "aws_api_gateway_stage" "stage" {
  stage_name            = var.stage_name
  description           = var.version_id
  rest_api_id           = aws_api_gateway_rest_api.gateway.id
  deployment_id         = aws_api_gateway_deployment.deployment.id
  variables             = var.variables
  cache_cluster_size    = var.cache_cluster_size
  cache_cluster_enabled = var.cache_cluster_enabled
  xray_tracing_enabled  = var.xray_tracing_enabled
}

resource "aws_api_gateway_method_settings" "setting" {
  rest_api_id = aws_api_gateway_rest_api.gateway.id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  method_path = var.method_path

  settings {
    logging_level                              = var.logging_level
    data_trace_enabled                         = var.data_trace_enabled
    metrics_enabled                            = var.metrics_enabled
    throttling_burst_limit                     = var.throttling_burst_limit
    throttling_rate_limit                      = var.throttling_rate_limit
    caching_enabled                            = var.caching_enabled
    cache_ttl_in_seconds                       = var.cache_ttl_in_seconds
    cache_data_encrypted                       = var.cache_data_encrypted
    require_authorization_for_cache_control    = var.require_authorization_for_cache_control
    unauthorized_cache_control_header_strategy = var.unauthorized_cache_control_header_strategy
  }
}

