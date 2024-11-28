resource "aws_instance" "test_env_ec2" {
  count                       = var.counter
  ami                         = data.aws_ami.debian_ami.id
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [data.aws_security_group.launch_wizard.id]
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.default.id

  tags = {
    Name = var.instance_tag[count.index]
  }
}

#### Data Resources ####
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }

  availability_zone = "eu-west-3a" # Ensure this matches the desired zone
}

data "aws_security_group" "launch_wizard" {
  filter {
    name   = "group-name"
    values = ["launch-wizard-1"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id] # Dynamically reference the default VPC
  }
}

data "aws_ami" "debian_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"] # Debian Official account
}

#### Variables ####
variable "instance_tag" {
  description = "Tag given to each deployed Instance"
  type        = list(string)
  default     = ["terraform-test-ssh-icmp"]
}

variable "key_pair_name" {
  description = "key_pair_name"
  type        = string
  default     = "rev-proxy"
}

variable "counter" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}
