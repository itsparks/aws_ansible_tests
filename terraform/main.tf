provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ansible_master" {
  ami = "ami-05d7cb15bfbf13b6d"
  instance_type = "t2.micro"
  key_name = "webserver_key"
  vpc_security_group_ids = [aws_security_group.sg_ansible_ssh.id]
  
  tags = {
    Name = "ansible_master"
  }
}
  
resource "aws_instance" "ansible_node1" {
  ami = "ami-05d7cb15bfbf13b6d"
  instance_type = "t2.micro"
  key_name = "webserver_key"
  vpc_security_group_ids = [aws_security_group.sg_ansible_ssh.id]
  
  tags = {
    Name = "ansible_node1"
  }
}
  
resource "aws_instance" "ansible_node2" {
  ami = "ami-05d7cb15bfbf13b6d"
  instance_type = "t2.micro"
  key_name = "webserver_key"
  vpc_security_group_ids = [aws_security_group.sg_ansible_ssh.id]
  
  tags = {
    Name = "ansible_node2"
  }
}

resource "aws_security_group" "sg_ansible_ssh" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}