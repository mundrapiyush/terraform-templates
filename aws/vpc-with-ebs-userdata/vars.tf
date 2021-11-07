variable "AWS_REGION" {
    type = string
}

variable "AWS_ACCESS_KEY" {
    type = string
}

variable "AWS_SECRET_KEY" {
    type = string
}

variable "AMIS" {
    type = map
    default = {
        ap-south-1 = "ami-0bb8408b37500e3be"
        ap-east-1 = "ami-d91961a8"
        ap-southeast-1 = "ami-03a4a9b0b0197b758"  
    }  
}

variable "VOLUME_NAME" {
    type = string
    default = "/dev/xvdh"
}