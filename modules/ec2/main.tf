# EC2 Module - Creates 3 EC2 Instances

resource "aws_instance" "main" {
  count                = var.instance_count
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name             = var.key_name

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.instance_name}-${count.index + 1}"
    Environment = var.environment
  }

  depends_on = []
}

# Elastic IPs for the instances
resource "aws_eip" "main" {
  count    = var.instance_count
  instance = aws_instance.main[count.index].id
  domain   = "vpc"

  tags = {
    Name        = "${var.instance_name}-eip-${count.index + 1}"
    Environment = var.environment
  }

  depends_on = [aws_instance.main]
}
