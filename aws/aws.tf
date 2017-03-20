#Ubuntu 14.04 LTS AMI: "ami-0d729a60"
#Ubuntu 16.04 LTS AMI: "ami-13be557e"

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} > ip_address.txt"
  }

  output "ip" {
    value = "${aws_eip.ip.public_ip}"
  }

}

resource "aws_eip" "ip" {
    instance = "${aws_instance.web.id}"
}
