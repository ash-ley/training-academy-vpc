# resource "aws_security_group" "my_app_private_a_sg" {
#   name        = "my_app_private_a_sg"
#   description = "Allow access to my Server"
#   vpc_id      = aws_vpc.main_vpc.id

# # INBOUND RULES
#   ingress {
#     description      = "SSH from my mac"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "my_app_private_a_sg"
#   }
# }

data "aws_ami" "my_aws_ami" {
    owners = ["137112412989"]
    filter {
        name = "name"
        values = ["amzn2-ami-kernel-*"]
    }
    most_recent = true
}

# EC2
# AMI ID
# INSTANCE TYPE
# KEYPAIR
# SUBNET - Private
# SECURITY GROUP
# USER-DATA template (optional)
resource "aws_instance" "my_private_ec2_instance" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.private_a.id
    #security_groups = [aws_security_group.my_app_private_a_sg.id]
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
}

# TASK:
# NEW EC2 in Public subnet
# Check the public IP Address exists or add the EIP to the server
# SSH using the keypair to the new public server
# Try to copy your private key to the public server and connect to the private server.

resource "aws_security_group" "my_app_sg" {
  name        = "my_app_sg"
  description = "Allow access to my Server"
  vpc_id      = aws_vpc.main_vpc.id

# INBOUND RULES
  ingress {
    description      = "SSH from my mac"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["81.108.153.97/32"]
  }

  ingress {
    description      = "SSH from my VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["192.168.0.0/16"]
  }

  egress {
    description = "Allow access to the world"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_app_sg"
  }
}

# EC2 PUBLIC
resource "aws_instance" "my_public_ec2_instance" {
    ami = data.aws_ami.my_aws_ami.id
    instance_type = var.instance_type
    key_name = var.keypair_name
    subnet_id = aws_subnet.public_a.id
    #security_groups = [aws_security_group.my_app_public_a_sg.id]
    vpc_security_group_ids = [aws_security_group.my_app_sg.id]
}