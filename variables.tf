variable "enabled" {
  type        = bool
  description = "If true, deploy the resources for the module"
  default     = true
}

variable "namespace" {
  description = "Namespace (e.g. `cp` or `cloudposse`)"
  type        = string
  default     = ""
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name  (e.g. `app` or `cluster`)"
  type        = string
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `logs`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}

variable "enable_log_file_validation" {
  type        = bool
  default     = true
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
}

variable "is_multi_region_trail" {
  type        = bool
  default     = false
  description = "Specifies whether the trail is created in the current region or in all regions"
}

variable "include_global_service_events" {
  type        = bool
  default     = false
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
}

variable "enable_logging" {
  type        = bool
  default     = true
  description = "Enable logging for the trail"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name for CloudTrail logs"
}

variable "cloud_watch_logs_role_arn" {
  type        = string
  description = "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group"
  default     = ""
}

variable "cloud_watch_logs_group_arn" {
  type        = string
  description = "Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered"
  default     = ""
}

variable "event_selector" {
  type = list(object({
    include_management_events = bool
    read_write_type           = string

    data_resource = list(object({
      type   = string
      values = list(string)
    }))
  }))

  description = "Specifies an event selector for enabling data event logging. See: https://www.terraform.io/docs/providers/aws/r/cloudtrail.html for details on this variable"
  default     = []
}

variable "kms_key_id" {
  type        = string
  description = "Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail"
  default     = ""
}

variable "is_organization_trail" {
  type        = bool
  default     = false
  description = "The trail is an AWS Organizations trail"
}
