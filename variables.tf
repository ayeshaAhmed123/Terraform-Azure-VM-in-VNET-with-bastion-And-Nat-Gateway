variable "client_id" {
    type= string
}
variable "tenant_id" {
    type= string
    sensitive= true
}
variable "subscription_id" {
    type= string
    sensitive= true
}
variable "client_secret" {
    type= string
    sensitive= true
}
variable "vm_user" {
    type= string
    sensitive= true
}
variable "vm_password" {
    type= string
    sensitive= true
}
