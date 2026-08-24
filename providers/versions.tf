terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "6.60.0" }
    azurerm = { source = "hashicorp/azurerm", version = "5.0.1" }
    google = { source = "hashicorp/google", version = "7.44.0" }
  }
}
