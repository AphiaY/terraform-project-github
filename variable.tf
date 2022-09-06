
variable "availability-zone1" {
  type    = string
  description = "making availability zone1"
  default = "eu-west-2a"
  
} 

variable "availability-zone2" {
  type    = string
  description = "making availability zone2"
  default = "eu-west-2b"
  
} 

variable "public-sub1-cidr-block" {
  type    = string
  description = "making sub2 cidr block variable"
  default = "10.0.1.0/24"
  
}

variable "public-sub2-cidr-block" {
  type    = string
  description = "making public sub2 cidr block variable"
  default = "10.0.2.0/24"
  
}  

variable "private-sub1-cidr-block" {
  type    = string
  description = "making sub1 cidr block variable"
  default = "10.0.3.0/24"
  
}

variable "private-sub2-cidr-block" {
  type    = string
  description = "making sub2 cidr block variable"
  default = "10.0.4.0/24"
  
}


variable "vpc-cidr-block" {
  type    = string
  description = "vpc cidr block variable"
  default = "10.0.0.0/16"
  
}
