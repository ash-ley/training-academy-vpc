variable "vpc_cidr" {
    description = "The CIDR of my VPC"
    type = string
}

variable "vpc_name" {
    description = "The name of my VPC"
    type = string
}

variable "gtw_name" {
    description = "The name of my Internet Gateway"
    type = string
}

variable "public_a_cidr" {
    description = "CIDR of the public Subnet A"
    type = string
}

variable "public_b_cidr" {
    description = "CIDR of the public Subnet B"
    type = string
}

variable "public_c_cidr" {
    description = "CIDR of the public Subnet C"
    type = string
}

variable "private_a_cidr" {
    description = "CIDR of the private Subnet A"
    type = string
}

variable "private_b_cidr" {
    description = "CIDR of the private Subnet B"
    type = string
}

variable "private_c_cidr" {
    description = "CIDR of the private Subnet C"
    type = string
}

variable "region" {
    description = "The region that we're working on"
    type = string
}