resource "aws_security_group" "web" {
    name = "vpc_web"
    description = "Allow incoming HTTP connections."
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "WebServerSG"
    }
}
resource "aws_security_group" "db" {
    name = "vpc_db"
    description = "Allow incoming mysql connections."

    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    vpc_id = "${aws_vpc.main.id}"

    tags {
        Name = "DbServerSG"
    }
}
