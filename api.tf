provider "aws" {
  region = var.region
}

resource "aws_api_gateway_rest_api" "example_api" {
  name        = var.api_name
  description = var.api_description
}

resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  parent_id   = aws_api_gateway_rest_api.example_api.root_resource_id
  path_part   = "example"
}

resource "aws_api_gateway_method" "example_method" {
  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "example_integration" {
  rest_api_id             = aws_api_gateway_rest_api.example_api.id
  resource_id             = aws_api_…
[2:46 am, 01/12/2023] Uppada Venkatesh Reddy: variable "region" {
  description = "AWS region"
}

variable "api_name" {
  description = "Name of the API Gateway"
}

variable "api_description" {
  description = "Description of the API Gateway"
}

variable "account_id" {
  description = "AWS account ID"
}
[2:46 am, 01/12/2023] Uppada Venkatesh Reddy: provider "aws" {
  region = var.region
}

resource "aws_glue_trigger" "example_trigger" {
  name         = var.trigger_name
  type         = "ON_DEMAND"
  description  = var.trigger_description
  schedule     = null
  start_on     = null
  enabled      = true

  actions {
    job_name = var.glue_job_name
    arguments = {
      "--param1" = "value1"
      "--param2" = "value2"
    }
  }
}

# Define variables
variable "region" {}
variable "trigger_name" {}
variable "trigger_description" {}
variable "glue_job_name" {}
