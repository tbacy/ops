# Need 4 identical nodes
resource "aws_instance" "cluster_deployment_1" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-072bfa7f83b597e2b"
  instance_type = "t2.small"
  associate_public_ip_address = true

  tags = {
    Name = "deployment_1 instance ${count.index}"
  }
}

# Create 2 more nodes if first 4 deployed with no issues

resource "aws_instance" "cluster_deployment_2" {
  count = 2 # create four similar EC2 instances

  ami           = "ami-072bfa7f83b597e2b"
  instance_type = "t2.small"
  associate_public_ip_address = true

  tags = {
    Name = "deployment_2 instance ${count.index}"
  }

  depends_on = [
    aws_instance.cluster_deployment_1
  ]
}