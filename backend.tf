terraform {
  backend "s3" {
    bucket = "talent-academy-439272626435-tfstate-ashley"
    key    = "sprint2/basic-vpc/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}