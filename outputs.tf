output "public_ip"   { value = aws_eip.jenkins_eip.public_ip }
output "jenkins_url" { value = "http://${aws_eip.jenkins_eip.public_ip}:8080" }
output "ssh_command" { value = "ssh -i <PATH_TO_PEM> ubuntu@${aws_eip.jenkins_eip.public_ip}" }
