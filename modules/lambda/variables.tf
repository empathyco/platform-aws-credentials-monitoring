variable "function_name" {
  default = "lambda_function"
}

variable "description" {
  default = ""
}

variable "handler" {
  default = "lambda_function.handler"
}

variable "runtime" {
  default = "python3.6"
}

variable "filename" {
  description = "Set path to zip file"
}

variable "environment" {
  description = "Environment configuration for the Lambda function"
  type        = "map"
  default     = {}
}

variable "tags" {
  description = "You can use tags to group and filter your functions"
  type        = "map"
  default     = {}
}

variable "timeout" {
  description = "timeout info"
  default     = "30"
}

variable "memory_size" {
  description = "Set memory size"
  default     = "128"
}



variable "security_group_ids" {
  type    = "list"
  default = []
}

variable "subnet_ids" {
  type    = "list"
  default = []
}

variable "policy_path" {
  description = "Set role path to load extra roles to the lambda functions"
  default     = ""
}

variable "policy_list" {
  description = "Set policy list to load extra policies"
  default     = []
}

variable "publish" {
  description = "Set true for publish version"
  default     = false
}

variable "description_test_alias" {
  description = "Set a description"
  default     = "A test alias"
}

variable "description_staging_alias" {
  description = "Set a description"
  default     = "A staging alias"
}

variable "description_production_alias" {
  description = "Set a description"
  default     = "A production alias"
}

variable "test_alias_version" {
  description = "Set version"
  default     = "$LATEST"
}

variable "staging_alias_version" {
  description = "Set version"
  default     = "1"
}

variable "production_alias_version" {
  description = "Set version"
  default     = "1"
}

variable "cron" {
  description = "Set to true if a crontab is needed"
  default     = false
}

variable "schedule" {
  description = "Set scheduled"
  default     = ""
}


