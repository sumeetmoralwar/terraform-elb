resource "aws_instance" "linux_vm" {
    ami                         = "ami-0d8f6eb4f641ef691"
    availability_zone           = "us-east-2c"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.aws_key}"
    subnet_id                   = "${var.aws_subnet}"
    source_dest_check = false
    vpc_security_group_ids      = ["${aws_security_group.sec-grp.id}"]
    associate_public_ip_address = true
    user_data = "${file("user-data.sh")}"
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = false
    }
    tags = {
        Name = "linux_vm"
    }
}

