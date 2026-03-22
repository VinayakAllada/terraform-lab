variable "container_config" {
  description = "List of container configurations"
  type = list(object({
    name = string
    port = number
  }))
}