output "arn" {
  value = aws_eks_cluster.this.arn
}

output "name" {
  description = "Used in : az arc connection"
  value       = aws_eks_cluster.this.name
}
