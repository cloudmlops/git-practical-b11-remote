// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

// Resource referencing from another file i.e networking.tf
resource "aws_instance" "terraform_test_ec2" {
  instance_type = var.instance_type
  ami           = data.aws_ami.server_ami.id
  key_name      = var.instance_key_name
  tags = {
    Name = "terraform_test_ec2"
  }

  vpc_security_group_ids = [aws_security_group.terraform_test_sg.id]
  subnet_id              = aws_subnet.terraform_public_test_subnet[0].id

  root_block_device {
    volume_size = var.vol_size
  }
}