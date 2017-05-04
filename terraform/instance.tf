resource "aws_instance" "web-1" {
    ami = "${var.ami_id}"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.terrakey.id}"
    vpc_security_group_ids = ["${aws_security_group.web.id}"]
    subnet_id = "${aws_subnet.us-east-public.id}"
    source_dest_check = false


    tags {
        Name = "Web Server 1"
    }
}
