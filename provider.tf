terraform {
  backend "s3" {
    bucket = "terraform-myproje-euc1-dev"
    key    = "eks/terraform.tfstate"
    region = "eu-central-1"
  }
}
