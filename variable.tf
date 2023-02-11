variable "cidr_block_address" {
  description = "cidr blocks for SG"
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  description = "Instance type of resource"
  type        = string
  default     = "t2.micro"
}

variable "instance_type_list" {
  type        = list(string)
  default     = ["t3.micro", "t2.micro"]
  description = "List of Instance"
}

variable "instance_type_map" {
  type = map(string)
  default = {
    "dev" = "t3.micro",
    "qa"  = "t2.micro"
  }
}


variable "keypair" {
  type    = string
  default = "Test"
}

variable "inbound" {
  default=["443","80","22"]
  
}

variable "outbound" {
  default=["443","80","22","1433"]
  
}


/*variable "cidr_block" {
  description = "CIDR_Block"
  default     = ["10.0.0.0/16", "10.1.0.0/16"]
}*/

variable "cidr_block" {
  description = "CIDR_Block"
  default = {
    cidr_one = "10.0.0.0/16"
    cidr_two = "10.1.0.0/16"
  }


}
