variable "project_id" {
  description = "The project ID to deploy to"
  default="qwiklabs-gcp-02-75ecde0b1b4b"
}

variable "network" {
  description = "The VPC network self link"
  default="default"
}

variable "subnet" {
  description = "The subnet self link"
  default="default"
}
