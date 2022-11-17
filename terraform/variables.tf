# https://developer.hashicorp.com/terraform/language/values/variables

variable "vpc_cidr" {
  type    = string
  description = "Enter the VPC CIDR Value."
  // default = "172.31.0.0/16"
}

variable "vpc_tag_name" {
  type    = string
  description = "Enter the VPC Tag Value"
}

/*
# Execute below command and terraform will ask input value of the 'var.vpc_cidr'
terraform apply -auto-approve

# Execute below command and pass specific variable value as.
terraform apply -var="vpc_cidr=172.31.0.0/18"

# Create a new file dev.tfvars and prod.tfvars defining the variable name with its values
terraform apply -var-file="dev.tfvars"

terraform apply -var-file="prod.tfvars"

# Add the default value in variables.tf file
terraform apply

*/