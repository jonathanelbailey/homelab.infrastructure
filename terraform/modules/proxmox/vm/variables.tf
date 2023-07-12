variable "virtual_machines" {
  type        = map
  default     = {}
  description = "Identifies the object of virtual machines."
}
# variable "cloud_init_pass" {
#   type        = string
#   default     = "password"
#   description = "Identifies the object of virtual machines."
# }
# variable "sshkeys" {
#   type        = list(string)
#   default     = []
#   description = "Identifies the object of virtual machines."
# }