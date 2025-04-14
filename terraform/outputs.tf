output "load_balancer_dns" {
  description = "Public DNS name of the load balancer"
  value       = aws_lb.app_lb.dns_name
}

output "ecr_repo_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.app_repo.repository_url
}
output "lb_dns" {
  value       = aws_lb.app_lb.dns_name
  description = "DNS name of the load balancer"
}
