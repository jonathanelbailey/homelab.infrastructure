variable "virtual_machines" {
  type        = map
  default     = {}
  description = "Identifies the object of virtual machines."
}
variable "cloud_init_user" {
  type        = string
  default     = ""
  description = "Changes the default cloud-init user."
}
variable "cloud_init_pass" {
  type        = string
  default     = ""
  description = "Changes the default cloud-init user password."
}
variable "sshkeys" {
  type        = string
  default     = ""
  description = "Add ssh public keys to VM."
}