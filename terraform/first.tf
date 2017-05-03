provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  tags {
    Name = "Test"
  }
}
resource "aws_subnet" "us-east-public" {
    vpc_id = "${aws_vpc.main.id}"

    cidr_block = "10.0.11.0/24"
    availability_zone = "us-east-1a"

    tags {
        Name = "Public Subnet"
    }
}
resource "aws_subnet" "us-east-private" {
    vpc_id = "${aws_vpc.main.id}"

    cidr_block = "10.0.12.0/24"
    availability_zone = "us-east-1a"

    tags {
        Name = "Private Subnet"
    }
}
