aws_region     = "us-east-1"
project_name   = "web-server"
private_domain = "sample.aws"
vpc_id         = "vpc-xxxxxxxxxxxxxxxxx" # Replace with your VPC ID
private_subnet_ids = [                   # Replace with your subnet IDs
  "subnet-xxxxxxxxxxxxxxxxx",
  "subnet-xxxxxxxxxxxxxxxxx"
]
key_pair_name        = ""                      # Add your key pair name (optional)
ami_id               = "ami-xxxxxxxxxxxxxxxxx" # Replace with Amazon Linux 2023 AMI ID
instance_type        = "t3.micro"
asg_desired_capacity = 2
asg_max_size         = 4
asg_min_size         = 1
