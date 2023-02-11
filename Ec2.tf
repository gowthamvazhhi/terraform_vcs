
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh-2"
  description = "Allow"

  dynamic "ingress" {
    
    for_each= var.inbound
    content {
    from_port = ingress.value
    to_port = ingress.value
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    
    for_each= var.outbound
    content {
    from_port = egress.value
    to_port = egress.value
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
  }



}

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "Session" {
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type_map["dev"]
  key_name      = var.keypair
  lifecycle {
    create_before_destroy = true

    precondition {
      condition     = data.aws_ami.amzlinux2.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
  }

  count = length(var.instance_type_list)
  tags = {
    "Name" = "Server ${count.index}"
  }

  /*for_each = var.instance_type_map
  instance_type=each.value
   tags = {
    "Name" = each.key
  }*/

  /* depends_on = [
    aws_s3_bucket.gowtham
  ] */
}


resource "aws_vpc" "Test_cidr" {

  for_each = var.cidr_block

  cidr_block = each.value

  tags = {
    "Name" = each.key
  }

}


resource "aws_s3_bucket" "gowtham" {
  bucket = "gowtham07101996"

}