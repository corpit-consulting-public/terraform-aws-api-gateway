resource "aws_api_gateway_rest_api" "gateway" {
  name           = "${var.name}"
  api_key_source = "${var.api_key_source}"
  description    = "${var.description}"
  body           = "${var.body}"
  endpoint_configuration {
    types = ["${var.types}"]
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  description       = "${var.deploy_description}"
  stage_description = "${var.stage_description}"
  rest_api_id       = "${aws_api_gateway_rest_api.gateway.id}"
  stage_name        = "${aws_api_gateway_stage.stage.stage_name}"
  depends_on        = [
            "aws_api_gateway_rest_api.gateway",
            "aws_api_gateway_stage.stage"           
  ]
}

resource "aws_api_gateway_stage" "stage" {
  stage_name            = "${var.stage_name}"
  rest_api_id           = "${aws_api_gateway_rest_api.gateway.id}"
  deployment_id         = "${aws_api_gateway_deployment.deployment.id}"
  variables             = "${var.variables}"
  cache_cluster_size    = "${var.cache_cluster_size}"
  cache_cluster_enabled = "${var.cache_cluster_enabled}"
  xray_tracing_enabled  = "${var.xray_tracing_enabled}"
}
