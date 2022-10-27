#-----------------------------------------
# General variables are in all inputs
#-----------------------------------------
variable "name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}