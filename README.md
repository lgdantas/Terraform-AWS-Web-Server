# Terraform-AWS-Web-Server

Terraform project for deploying a secure and scalable AWS infrastructure. Features include Application Load Balancer (ALB) with HTTPS, Auto Scaling Group with Nginx instances, custom SSL certificate management, and private Route53 hosted zone.

## Infrastructure with Terraform

This Terraform project sets up AWS infrastructure including:
- Application Load Balancer (ALB) with HTTPS
- Auto Scaling Group with EC2 instances running Nginx
- Custom SSL certificate import to ACM
- Private Route53 hosted zone
- Required security groups and IAM roles

### Prerequisites
- Terraform >= 1.8.0
- AWS credentials configured
- Existing VPC with private subnets
- Existing key pair
- SSL certificate files in the cert directory
  - cert/privatekey.pem
  - cert/publiccert.pem

### Usage

1. Update terraform.tfvars with your values:
   - VPC ID
   - Private subnet IDs
   - Key pair name
   - AMI ID (Amazon Linux 2023)

2. Replace the placeholder SSL certificate files in the cert directory with your actual certificates.

3. Initialize Terraform:
```bash
terraform init
```

4. Plan the changes:
```bash
terraform plan
```

5. Apply the changes:
```bash
terraform apply
```

### Outputs
- ALB DNS name
- Private hosted zone ID
- Application URL
- Auto Scaling Group name
- ACM certificate ARN


## Testing

sudo cp ca.crt /etc/pki/ca-trust/source/anchors/
sudo update-ca-trust extract
curl https://<project_name>.<private_domain>