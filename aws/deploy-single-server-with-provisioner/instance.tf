resource "aws_key_pair" "examplekp" {
    key_name = "examplekey"
    public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
  
resource "aws_instance" "example" {
    
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.nano"
    key_name = "${aws_key_pair.examplekp.key_name}"

    provisioner "file" {
      source = "script.sh"
      destination = "/tmp/script.sh"
    }

    provisioner "local-exec" {
        command = "echo ${aws_instance.example.public_ip} >> public_ip.txt"
    }

    provisioner "remote-exec" {
      inline = [
          "chmod +x /tmp/script.sh",
          "sudo /tmp/script.sh"
      ]
    }

    connection {
        type = "ssh"
        host = coalesce(self.public_ip, self.private_ip)
        user = "${var.INSTANCE_USERNAME}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
}

output "ip" {
    value = "${aws_instance.example.public_ip}"
}
