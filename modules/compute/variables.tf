
variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "bastion_subnet_id" {
    type = string
}
variable "private_subnet_id" {
    type = string
}
variable "vm_user" {
    type= string
    sensitive= true
}
variable "vm_password" {
    type= string
    sensitive= true
}