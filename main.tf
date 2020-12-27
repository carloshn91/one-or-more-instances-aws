provider "aws" {
  region  = var.aws_region
  profile = var.aws_user
}

resource "aws_key_pair" "my-pairs" {
  key_name   = var.aws_my-pairs
  public_key = file(var.aws_path_to_your_public_key)
}

resource "aws_security_group" "security-group" {
  name        = var.aws_sg_name

  dynamic "ingress" {
    for_each = var.aws_default_ingress
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value["cidr_blocks"]
   }
 }

   dynamic "egress" {
    for_each = var.aws_default_egress
    content {
      description = egress.value["description"]
      from_port   = egress.key
      to_port     = egress.key
      protocol    = "-1"
      cidr_blocks = egress.value["cidr_blocks"]
   }
 }
}

resource "aws_instance" "my-instances" {
  count         = var.aws_instance-count
  ami           = var.aws_your_ami
  instance_type = var.aws_instance_type
  key_name      = aws_key_pair.my-pairs.key_name

 vpc_security_group_ids = [
    aws_security_group.security-group.id
  ]
}