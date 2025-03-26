variable "image_id" {
    type        = string # essa linha é utilizada para forçar o tipo do valor de entrada
    description = "O ID da AMI usada"
    validation {
      condition = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
      error_message = "O ID da AMI não é válido."
    }
}

