variable "aws_region" {
  description = "Region to be used"
  type = string
}

variable "aws_user" {
  description = "AWS user to be used (found in ~/.aws/credentials)"
  type = string
}

variable "aws_my-pairs" {
  description = "Name to your key"
  type = string
}

variable "aws_path_to_your_public_key" {
  description = "Path to your SSH public key"
  type    = string
}

variable "aws_sg_name" {
  description = "Security Group Name"
  type = string
}

variable "aws_instance-count" {
  description = "Number of instances to be created"
  type = number
}

variable "aws_your_ami" {
  description = "Identification of the AMI to be used"
  type = string
}

variable "aws_instance_type" {
  default = "t2.micro"
}

variable aws_default_ingress {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    22 = { description = "SSH Access Security Group", cidr_blocks = [ "0.0.0.0/0" ] }
    80 = { description = "Allow traffic on port 80 (HTTP)", cidr_blocks = [ "0.0.0.0/0" ] }
    443 = { description = "Allow traffic on port 443 (HTTPS)", cidr_blocks = [ "0.0.0.0/0" ] }
  }
}

variable aws_default_egress {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    0 = { description = "Outbound Traffic Security Group", cidr_blocks = [ "0.0.0.0/0" ] }
  }
}
