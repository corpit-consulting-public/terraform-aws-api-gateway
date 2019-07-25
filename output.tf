
output "id" {
  description = "The id of the apigatewai rest api"
  value       = "${aws_api_gateway_rest_api.gateway.id}"
}
