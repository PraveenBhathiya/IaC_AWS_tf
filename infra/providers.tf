provider"aws"{
    region = var.region
}

locals {
  tags = {
    Project = var.project_name
    ManagedBy = "Terraform"
    Environment = var.environment
  }
}