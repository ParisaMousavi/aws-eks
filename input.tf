#-----------------------------------------
# General variables are in all inputs
#-----------------------------------------
variable "name" {
  type    = string
  default = "dummyname"
}

variable "projectname" {
  type    = string
  default = "dummyproj"
}

variable "region_shortname" {
  type    = string
  default = "EUC1"
}

variable "costcenter" {
  type    = string
  default = "dummyXYZ"
}

variable "environment" {
  type    = string
  default = "env"
}

#-----------------------------------------
# service specific variables
#-----------------------------------------
variable "subnet_ids" {
  type = list(string)
}