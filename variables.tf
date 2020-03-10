variable "name" {
  type        = "string"
  description = "The name of the Rest API"
}

variable "description" {
  type        = "string"
  description = "The description of the REST API"
  default     = ""
}

variable "endpoint_configuration" {
  type        = "map"
  description = "Nested argument defining API endpoint configuration including endpoint type. Defined below."
  default     = {}
}

variable "binary_media_types" {
  type        = "list"
  description = "The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
  default     = []
}

variable "minimum_compression_size" {
  type        = "string"
  description = "Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default)."
  default     = "-1"
}

variable "body" {
  type        = "string"
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API.(true or false)"
  default     = "false"
}

variable "policy" {
  type        = "string"
  description = "JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform"
  default     = ""
}

variable "api_key_source" {
  type        = "string"
  description = "The source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER."
  default     = "HEADER"
}

#######Note  If the body argument is provided, the OpenAPI specification will be used to configure the resources, methods and integrations for the Rest API. If this argument is provided, the following resources should not be managed as separate ones, as updates may cause manual resource updates to be overwritten

##aws_api_gateway_resource
##aws_api_gateway_method
##aws_api_gateway_method_response
##aws_api_gateway_method_settings
##aws_api_gateway_integration
##aws_api_gateway_integration_response
##aws_api_gateway_gateway_response
##aws_api_gateway_model

##Endpoint_configuration

variable "types" {
  type        = "list"
  description = "A list of endpoint types. This resource currently only supports managing a single value. Valid values: EDGE, REGIONAL or PRIVATE. If unspecified, defaults to EDGE. Must be declared as REGIONAL in non-Commercial partitions. Refer to the documentation for more information on the difference between edge-optimized and regional APIs"
  default     = []
}

variable "stage_name" {
}
