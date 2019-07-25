resource "aws_api_gateway_rest_api" "gateway" {
  name           = "${var.name}"
  api_key_source = "${var.api_key_source}"
  description    = "${var.description}"
  endpoint_configuration {
    types = ["${var.types}"]
  }
}
