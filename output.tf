/*output "Ec2_instance_State" {
  description = "State of instance"
  value       = aws_instance.Session.instance_state
}
output "Ec2_instance_aZ" {
  description = "Az in instance"
  value       = aws_instance.Session.availability_zone
}
output "Ec2_instance_public_ip" {
  description = "Public ip of instance"
  value       = aws_instance.Session.public_ip
}

output "Ec2_instance_public_dns" {
  description = "Public dns of instance"
  value       = aws_instance.Session.public_dns
} 

output "Ec2_instance_public_ip" {
  description = "Public ip of instance"
  value       = [for instance in aws_instance.Session : instance.public_ip]
}

output "Ec2_instance_public_dns" {
  description = "Public dns of instance"
  value       = [for instance in aws_instance.Session : instance.public_dns]
}
output "ec2instanceusingsplat" {
  description = "Public dns of instance"
  value       = aws_instance.Session[*].public_dns
}*/
