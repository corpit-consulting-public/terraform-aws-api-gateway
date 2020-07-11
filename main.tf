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
  stage_name        = var.stage_name
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

 dynamic "settings" {
  for_each = var.settings
  content {
    logging_level                              = lookup(settings.value, "logging_level", null)
    data_trace_enabled                         = lookup(settings.value, "data_trace_enabled", null)
    metrics_enabled                            = lookup(settings.value, "metrics_enabled", null)
    throttling_burst_limit                     = lookup(settings.value, "throttling_burst_limit", null)
    throttling_rate_limit                      = lookup(settings.value, "throttling_rate_limit", null)
    caching_enabled                            = lookup(settings.value, "caching_enabled", null)
    cache_ttl_in_seconds                       = lookup(settings.value, "cache_ttl_in_seconds", null)
    cache_data_encrypted                       = lookup(settings.value, "cache_data_encrypted", null)
    require_authorization_for_cache_control    = lookup(settings.value, "require_authorization_for_cache_control", null)
    unauthorized_cache_control_header_strategy = lookup(settings.value, "unauthorized_cache_control_header_strategy", null)
    }
  }
}

