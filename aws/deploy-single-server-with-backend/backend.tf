terraform {
  backend "s3" {
      bucket = "terraform-state-piyush"
      key = "terraform/deploy-single-server-with-backend"
      region = "ap-south-1"
  }
}