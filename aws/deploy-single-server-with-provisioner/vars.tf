variable "AWS_ACCESS_KEY" {
    type = string
}

variable "AWS_SECRET_KEY" {
    type = string
}

variable "AWS_REGION" {
    type = string
    default = "ap-south-1"
}

variable "AMIS" {
    type = map
    default = {
        ap-south-1 = "ami-0bb8408b37500e3be"
        ap-east-1 = "ami-d91961a8"
        ap-southeast-1 = "ami-03a4a9b0b0197b758"
    }
}

variable "PATH_TO_PRIVATE_KEY" {
    default = "examplekp"
}

variable "PATH_TO_PUBLIC_KEY" {
    default = "examplekp.pub"
}

variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}