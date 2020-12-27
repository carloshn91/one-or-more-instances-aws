# One Or More Instances For AWS

Simple project to create one or more instances on AWS using the Terraform.

Advisable to use the same in Development environments, but nothing that a modification does not solve to put it in Production ;)

## Terraform Version

Terraform v0.14.2

## Requirements

| Name | Version |
|---|---|
| terraform | >= 0.12.6 |
| aws | >= 2.65 |

## How to use

### Step 1: Download the repository in the directory you find convenient

### Step 2: Run the commands below:

`terraform init`

`terraform plan`

`terraform apply`

### Step 3: Open your AWS Console in the EC2 Service

## Variables used:

|  Name 	|  Description 	|  Type 	| Required | 
|:-:	|:-:	|:-:	|:-:	|
| aws_region  	| Region to be used  	| string  	| Yes |
| aws_user  	|  AWS user to be used (found in ~/.aws/credentials) 	| string  	| Yes |
| aws_my-pairs  	|  Name of your key 	| string  	| Yes |
| aws_path_to_your_public_key  	| Path to your SSH public key  	| string  	| Yes |
| aws_sg_name  	| Security Group Name  	| string  	| Yes |
| aws_instance-count  	| Number of instances to be created  	| number  	| Yes |
| aws_your_ami  	| Identification of the AMI to be used  	| string  	| Yes |
| aws_instance_type 	| Type of instance to be used  	|  default=t2.micro 	| No  	|
| aws_default_ingress	| Ingress rules already released for ports 22, 80 and 443  	| map(object) 	| No  	|
| aws_default_egress   	|  Egress rules for all ports 	| map(object)  	|  No 	|
