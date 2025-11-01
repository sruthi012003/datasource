provider "aws" {
  region = "us-east-1"
}
 
data "aws_vpc" "existing_vpc" {
  id = "vpc-03442070d3819fb94"
}
 
resource "aws_subnet" "example_subnet" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a" # updated to match region
 
  tags = {
    Name = "Example-Subnet"
  }
}
 
resource "aws_internet_gateway" "gw" {
  vpc_id = data.aws_vpc.existing_vpc.id
 
  tags = {
    Name = "datasource-Terraform-internet-gateway"
  }
}





