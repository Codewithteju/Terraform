variable "region" {
  description = "creating variable for region"
  default     = "us-east-1"
}

variable "zone" {
  description = "creating variable for availability zone"
  default     = "us-east-1a"
}

variable "ami" {
  type = map(any)
  default = {
    us-east-1 = "ami-0e2c8caa4b6378d8c"
    us-east-2 = "ami-036841078a4b68e14"
  }

}