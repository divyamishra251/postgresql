output "public_instance_id" {
  value = aws_instance.public.id
}

output "public_instance_public_ip" {
  value = aws_instance.public.public_ip
}

output "public_instance_private_ip" {
  value = aws_instance.public.private_ip
}

output "private_instance_1_id" {
  value = aws_instance.private_1.id
}

output "private_instance_1_private_ip" {
  value = aws_instance.private_1.private_ip
}

output "private_instance_2_id" {
  value = aws_instance.private_2.id
}

output "private_instance_2_private_ip" {
  value = aws_instance.private_2.private_ip
}