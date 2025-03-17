
resource "aws_instance" "avinash" {
  ami                         = "ami-0fcf52bcf5db7b003"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "test"
  vpc_security_group_ids      = [aws_security_group.kumar.id]
  subnet_id = aws_subnet.mani[0].id
  tags = {
    Name = "avinash"

  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("test.pem")
      host        = aws_instance.avinash.public_ip

    }
    inline = [
      "sudo apt update",
      "sudo apt install openjdk-17-jdk -y",
      "sudo apt install maven -y",
      "sudo apt install jenkins -y"

    ]
  }
}