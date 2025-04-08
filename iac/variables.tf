variable "region" {
  description = "Azure region to create infrastructure in"
  default     = "westeurope"
}
variable "project" {
  description = "The project name"
  default     = "cloudquickstart"
}
variable "environment" {
  description = "The project environment"
  default     = "dev"
}
variable "tags_extra" {
  type        = map(string)
  description = "Extra tags that should be applied to all resources"
  default     = {}
}
