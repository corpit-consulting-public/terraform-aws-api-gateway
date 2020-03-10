resource "aws_api_gateway_rest_api" "gateway" {
  name           = "${var.name}"
  api_key_source = "${var.api_key_source}"
  description    = "${var.description}"
  body           = "${var.body}"
  endpoint_configuration {
    types = ["${var.types}"]
  }
}

resource "aws_api_gateway_deployment" "Deployment" {
  rest_api_id = "${aws_api_gateway_rest_api.gateway.id}"
  stage_name  = "${var.stage_name}"
  depends_on = ["aws_api_gateway_rest_api.gateway"]
}
