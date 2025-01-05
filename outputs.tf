output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app.dns_name
}

output "private_zone_id" {
  description = "ID of the private hosted zone"
  value       = aws_route53_zone.private.zone_id
}

output "app_url" {
  description = "Application URL"
  #value       = "https://app.sample.aws"
  value       = aws_route53_record.alb.name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}

output "acm_certificate_arn" {
  description = "ARN of the imported ACM certificate"
  value       = aws_acm_certificate.custom_cert.arn
}