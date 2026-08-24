resource "aws_security_group" "ssh" {
  name        = "${var.name}-ssh"
  description = "SSH access for the lab instance"
  vpc_id      = var.vpc_id
  ingress { description = "SSH from approved CIDR"; from_port = 22; to_port = 22; protocol = "tcp"; cidr_blocks = [var.allowed_ssh_cidr] }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}
resource "aws_instance" "vm" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids     = [aws_security_group.ssh.id]
  associate_public_ip_address = true
  user_data                   = var.user_data
  metadata_options { http_tokens = "required" }
  root_block_device { encrypted = true }
  tags = { Name = var.name, Project = "devops-project-21", Cloud = "aws", ManagedBy = "terraform" }
}
output "instance_id" { value = aws_instance.vm.id }
output "public_ip" { value = aws_instance.vm.public_ip }
