## Usage

```hcl

resource "aws_api_gateway_client_certificate" "Certificate" {
  description = "Test cartificate"
}

module "gw_rest_api" {
  source             = "corpit-consulting-public/api-gateway-rest-api/aws"
  version            = "v2.0.0"
  name           = "${var.name}"
  description    = "${var.description}"
  api_key_source = "${var.api_key_source}"
  body           = "${file("gw-swagger/API-v1-swagger-apigateway.yaml")}"
  types          = ["${var.types}"]
  stage_name         = "${var.stage_name}"
  cache_cluster_size = "${var.cache_cluster_size}"
  variables      {
    variable_01 = "${module.module_name.output}"
    variable_02 = "${var.variable}"
    variable_03 = "${resource_type.name.output}"
  }
}


```
 * _The "body" input is used to consume a swagger.yaml file to replicate the configuration of another aws account_

 * _The client certificate resource creates a client gateway certificate automatically for all apigateway rest api_

 * _The api gateway deployment resource is required to use the api gateway stage module_
