terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

provider "ibm" {
    ibmcloud_api_key = var.IBMCLOUD_API_KEY
    region = "us-east"
}