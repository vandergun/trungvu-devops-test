output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.app.repository_url
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.app.name
}

output "task_definition_family" {
  description = "Family name of the task definition"
  value       = aws_ecs_task_definition.app.family
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.app.arn
}