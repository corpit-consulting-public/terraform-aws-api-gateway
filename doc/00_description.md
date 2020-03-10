# terraform-aws-api-gateway

Terraform module that creates and replicates Api Gateways resources on AWS using a Swagger file.

### Points to consider 
 
To replicate an api gateway from an external account you need:
  * Declare the "body" variable to replicate the configuration of another account
  * Export the Swagger file (Export as Swagger + API Gateway Extensions) of the account to be replicated and consumed from a swagger.yaml file


### Note: 

  If the body argument is provided, the OpenAPI specification will be used to configure the resources, methods and integrations for the Rest API. If this argument is provided, the following resources should not be managed as separate ones, as updates may cause manual resource updates to be overwritten:

 * aws_api_gateway_resource
 * aws_api_gateway_method
 * aws_api_gateway_method_response
 * aws_api_gateway_method_settings
 * aws_api_gateway_integration
 * aws_api_gateway_integration_response
 * aws_api_gateway_gateway_response
 * aws_api_gateway_model

