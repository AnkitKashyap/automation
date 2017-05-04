resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw-test.id}"
  }

  tags {
    Name = "Public main"
  }
}
resource "aws_route_table_association" "s" {
    subnet_id = "${aws_subnet.us-east-public.id}"
    route_table_id = "${aws_route_table.r.id}"
}
