# variables.tf

variable "region" {
  description = "The AWS region things are created in"
  default     = "us-west-2"
}

variable "prefix" {
    description = "prefix prepended to names of all resources created"
    default = "ecs-terraform"
}

variable "port" {
    description = "port the container exposes, that the load balancer should forward port 80 to"
    default = "80"
}

variable "source_path" {
  description = "source path for project"
  default     = "./project2"
}

variable "envvars" {
  type=map(string)
  description = "Variables to set in the environment of the container"
  default = {
  }
}

variable "secvars" {
  type=map(string)
  description = "Variables to set in the environment of the container"
  default = {
  }
}

variable "domain_name" {
  description = "FQDN for the certificate is issued"
  type        = string
}

variable "hosted_zone_name" {
  description = "Need for DNS validation, hosted zone name where record validation will be stored"
  type        = string
}

variable "cname_record_name" {
  description = "Enter FQDN where you want to live your app"
  type        = string
}

variable "db_pass" {
  description = "Enter the Database password to be stored in SSM"
  type        = string
}
