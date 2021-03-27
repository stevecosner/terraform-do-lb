


provider "digitalocean" {
    token = "${var.token}"
}


resource "digitalocean_loadbalancer" "public" {
  name = "loadbalancer-1"
  region = "nyc3"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

}

  resource "digitalocean_droplet" "web" {
    name  = "web"
    image = "ubuntu-18-04-x64"
    region = "nyc3"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}

resource "digitalocean_droplet" "web2" {
    name  = "web2"
    image = "ubuntu-18-04-x64"
    region = "nyc3"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web2.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}

resource "digitalocean_droplet" "web3" {
    name  = "web3"
    image = "ubuntu-18-04-x64"
    region = "nyc3"
    size   = "s-1vcpu-1gb"
    user_data  = "${file("web3.conf")}"
    ssh_keys = [
    "${var.ssh_keys}"
    ]
}


output "ip2" {
    value = "${digitalocean_droplet.web.ipv4_address}"
}
output "ip3" {
    value = "${digitalocean_droplet.web2.ipv4_address}"
}
output "ip4" {
    value = "${digitalocean_droplet.web3.ipv4_address}"
}
  




