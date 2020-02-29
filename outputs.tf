output "master_pub_ip" {
  value = aws_instance.K8S-Master.*.public_ip
}

output "master_priv_ip" {
  value = aws_instance.K8S-Master.*.private_ip
}

output "worker1_pub_ip" {
  value = aws_instance.K8S-Worker-1.*.public_ip
}

output "worker1_priv_ip" {
  value = aws_instance.K8S-Worker-1.*.private_ip
}

output "worker2_pub_ip" {
  value = aws_instance.K8S-Worker-2.*.public_ip
}

output "worker2_priv_ip" {
  value = aws_instance.K8S-Worker-2.*.private_ip
}