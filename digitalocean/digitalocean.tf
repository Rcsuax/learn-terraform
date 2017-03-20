resource "digitalocean_ssh_key" "default" {
	name = "Terraform"
	public_key = ""
}

resource "digitalocean_droplet" "web" {
	image = "ubuntu-14-04-x64"
	name = "web-1"
	region = "lon1"
	size = "512mb"
	ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}
