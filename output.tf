output "id" {
  description = "The id of the apigateway rest api"
  value       = "${aws_api_gateway_rest_api.gateway.id}"
}

output "name" {
  description = "The name of the apigateway rest api"
  value       = "${aws_api_gateway_rest_api.gateway.name}"
}

output "description" {
  description = "The description of the apigateway rest api"
  value       = "${aws_api_gateway_rest_api.gateway.description}"
}

output "root_resource_id" {
  value       = "${aws_api_gateway_rest_api.gateway.root_resource_id}"
}

output "deployment_id" {
  value = "${aws_api_gateway_deployment.deployment.id}"
}

####Stage

output "stage_id" {
  description = "The id of the stage"
  value       = "${aws_api_gateway_stage.stage.id}"
}

output "stage_name" {
  description = "The id of the stage"
  value       = "${aws_api_gateway_stage.stage.stage_name}"
}
