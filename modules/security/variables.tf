
variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "private_subnet_id" {
    type = string
}
variable "nsg_id" {
    type= string
    sensitive= true
}