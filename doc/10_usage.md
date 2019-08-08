## Usage

```hcl

resource "aws_api_gateway_client_certificate" "Certificate" {
  description = "Test cartificate"
}

module "gw_rest_api" {
  source         = "./modules/terraform-aws-apigateway-rest-api"
  name           = "${var.name}"
  description    = "${var.description}"
  api_key_source = "${var.api_key_source}"
  body           = "${file("gw-swagger/API-v1-swagger-apigateway.yaml")}"
  types          = ["${var.types}"]
}


resource "aws_api_gateway_deployment" "test-deployment" {
  rest_api_id = "${module.gw_rest_api.id}"
  stage_name  = "Test"
  
}

```
 * _The "body" input is used to consume a swagger.yaml file to replicate the configuration of another aws account_

 * _The client certificate resource creates a client gateway certificate automatically for all apigateway rest api_

 * _The api gateway deployment resource is required to use the api gateway stage module_
