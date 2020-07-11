variable "name" {
  type        = string
  description = "The name of the Rest API"
}

variable "description" {
  type        = string
  description = "The description of the REST API"
  default     = ""
}

variable "endpoint_configuration" {
  type        = map(string)
  description = "Nested argument defining API endpoint configuration including endpoint type. Defined below."
  default     = {}
}

variable "binary_media_types" {
  type        = list(string)
  description = "The list of binary media types supported by the RestApi. By default, the RestApi supports only UTF-8-encoded text payloads."
  default     = []
}

variable "minimum_compression_size" {
  type        = string
  description = "Minimum response size to compress for the REST API. Integer between -1 and 10485760 (10MB). Setting a value greater than -1 will enable compression, -1 disables compression (default)."
  default     = "-1"
}

variable "body" {
  type        = string
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API.(true or false)"
  default     = "false"
}

variable "policy" {
  type        = string
  description = "JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform"
  default     = ""
}

variable "api_key_source" {
  type        = string
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
  type        = list(string)
  description = "A list of endpoint types. This resource currently only supports managing a single value. Valid values: EDGE, REGIONAL or PRIVATE. If unspecified, defaults to EDGE. Must be declared as REGIONAL in non-Commercial partitions. Refer to the documentation for more information on the difference between edge-optimized and regional APIs"
  default     = []
}

###Deployment variables

variable "deploy_stage_name" {
  type    = string
  default = ""
}

variable "deploy_description" {
  type        = string
  description = "The description of the deployment"
  default     = ""
}

variable "stage_description" {
  type        = string
  description = "The description of the stage"
  default     = ""
}

variable "deploy_variables" {
  type        = map(string)
  description = "A map that defines variables for the stage"
  default     = {}
}

#######Stage variables

variable "stage_name" {
  type        = string
  description = "The name of the stage"
}

variable "access_log_settings" {
  type        = map(string)
  description = "Enables access logs for the API stage. Detailed below."
  default     = {}
}

variable "cache_cluster_enabled" {
  type        = string
  description = "Specifies whether a cache cluster is enabled for the stage"
  default     = "false"
}

variable "cache_cluster_size" {
  type        = string
  description = "The size of the cache cluster for the stage, if enabled. Allowed values include 0.5, 1.6, 6.1, 13.5, 28.4, 58.2, 118 and 237."
  default     = "0.5"
}

variable "client_certificate_id" {
  type        = string
  description = "The identifier of a client certificate for the stage."
  default     = ""
}

variable "description_stage" {
  type        = string
  description = "The description of the stage"
  default     = ""
}

variable "documentation_version" {
  type        = string
  description = "The version of the associated API documentation"
  default     = ""
}

variable "variables" {
  type        = map(string)
  description = "A map that defines the stage variables"
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}

variable "xray_tracing_enabled" {
  type        = string
  description = "Whether active tracing with X-ray is enabled (true or false) . Defaults to false."
  default     = "false"
}

#####access_log_settings

variable "destination_arn" {
  type        = string
  description = "ARN of the log group to send the logs to. Automatically removes trailing :* if present."
  default     = ""
}

variable "format" {
  type        = string
  description = "The formatting and values recorded in the logs. For more information on configuring the log format rules"
  default     = ""
}

variable "rest_api_id" {
  type    = string
  default = ""
}

#####Variables for Method Settings

variable "method_path" {
  type        = string
  description = "Method path defined as {resource_path}/{http_method} for an individual method override, or */* for overriding all methods in the stage."
}

variable "settings" {
  type        = map(string)
  description = "The settings block, see below."
  default     = {}
}

## Settings

variable "metrics_enabled" {
  type        = string
  description = " Specifies whether Amazon CloudWatch metrics are enabled for this method. (treu or false)"
  default     = ""
}

variable "logging_level" {
  type        = string
  description = "Specifies the logging level for this method, which effects the log entries pushed to Amazon CloudWatch Logs. The available levels are OFF, ERROR, and INFO."
  default     = ""
}

variable "data_trace_enabled" {
  type        = string
  description = "Specifies whether data trace logging is enabled for this method, which effects the log entries pushed to Amazon CloudWatch Logs."
  default     = ""
}

variable "throttling_burst_limit" {
  type        = string
  description = "Specifies the throttling burst limit."
  default     = "500"
}

variable "throttling_rate_limit" {
  type        = string
  description = "Specifies the throttling rate limit."
  default     = "10000.0"
}

variable "caching_enabled" {
  type        = string
  description = "pecifies whether responses should be cached and returned for requests. A cache cluster must be enabled on the stage for responses to be cached."
  default     = ""
}

variable "cache_ttl_in_seconds" {
  type        = string
  description = "Specifies the time to live (TTL), in seconds, for cached responses. The higher the TTL, the longer the response will be cached."
  default     = "300"
}

variable "cache_data_encrypted" {
  type        = string
  description = "Specifies whether the cached responses are encrypted."
  default     = ""
}

variable "require_authorization_for_cache_control" {
  type        = string
  description = "Specifies whether authorization is required for a cache invalidation request."
  default     = ""
}

variable "unauthorized_cache_control_header_strategy" {
  type        = string
  description = "Specifies how to handle unauthorized requests for cache invalidation. The available values are FAIL_WITH_403, SUCCEED_WITH_RESPONSE_HEADER, SUCCEED_WITHOUT_RESPONSE_HEADER."
  default     = ""
}

variable "version_id" {
  type    = string
  default = ""
}

