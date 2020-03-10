
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

## README.md
This README file was created runnnign generate-readme.sh placed insinde hooks directory.
If you want to update README.md file, run that script while being in 'hooks' folder.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access\_log\_settings | Enables access logs for the API stage. Detailed below. | map | `<map>` | no |
| api\_key\_source | The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER. | string | `"HEADER"` | no |
| binary\_media\_types | The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads. | list | `<list>` | no |
| body | An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API.(true or false) | string | `"false"` | no |
| cache\_cluster\_enabled | Specifies whether a cache cluster is enabled for the stage | string | `"false"` | no |
| cache\_cluster\_size | The size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237. | string | `"0.5"` | no |
| client\_certificate\_id | The identifier of a client certificate for the stage. | string | `""` | no |
| deploy\_description | The description of the deployment | string | `""` | no |
| deploy\_stage\_name |  | string | `""` | no |
| deploy\_variables | A map that defines variables for the stage | map | `<map>` | no |
| description | The description of the REST API | string | `""` | no |
| description\_stage | The description of the stage | string | `""` | no |
| destination\_arn | ARN of the log group to send the logs to. Automatically removes trailing :* if present. | string | `""` | no |
| documentation\_version | The version of the associated API documentation | string | `""` | no |
| endpoint\_configuration | Nested argument defining API endpoint configuration including endpoint type. Defined below. | map | `<map>` | no |
| format | The formatting and values recorded in the logs. For more information on configuring the log format rules | string | `""` | no |
| minimum\_compression\_size | Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default). | string | `"-1"` | no |
| name | The name of the Rest API | string | n/a | yes |
| policy | JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform | string | `""` | no |
| rest\_api\_id |  | string | `""` | no |
| stage\_description | The description of the stage | string | `""` | no |
| stage\_name | The name of the stage | string | n/a | yes |
| tags | A mapping of tags to assign to the resource. | map | `<map>` | no |
| types | A list of endpoint types. This resource currently only supports managing a single value. Valid values: EDGE, REGIONAL or PRIVATE. If unspecified, defaults to EDGE. Must be declared as REGIONAL in non-Commercial partitions. Refer to the documentation for more information on the difference between edge-optimized and regional APIs | list | `<list>` | no |
| variables | A map that defines the stage variables | map | `<map>` | no |
| xray\_tracing\_enabled | Whether active tracing with X-ray is enabled (true or false) . Defaults to false. | string | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| deployment\_id |  |
| id | The id of the apigateway rest api |
| name | The name of the apigateway rest api |
| root\_resource\_id |  |
| stage\_id | The id of the stage |
| stage\_name | The id of the stage |

