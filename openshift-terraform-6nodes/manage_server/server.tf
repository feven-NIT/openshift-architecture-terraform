resource "hcloud_server" "bastion"{
  name = "bastion"
  image = "fedora-34"
  location = "fsn1"
  ssh_keys = [hcloud_ssh_key.default.id] 
  server_type = "cx11"
  labels = {
    app = "bastion"
  }
}

resource "hcloud_server" "bootstrap"{
  name = "bootstrap"
  image = "fedora-34"
  rescue = "linux64"
  location = "fsn1"
  ssh_keys = [hcloud_ssh_key.default.id]
  server_type = "cx41"
  labels = {
    app = "bootstrap"
    lb = "api"
  }
  count = 1
}

resource "hcloud_server" "master"{
  count = 3
  name = "master-${count.index}"
  image = "fedora-34"
  rescue = "linux64"
  location = "fsn1"
  ssh_keys = [hcloud_ssh_key.default.id] 
  server_type = "cx41"
  labels = {
    app = "master"
    lb = "api"
  }
}

resource "hcloud_server" "worker"{
  count = 2
  name = "worker-${count.index}"
  image = "fedora-34"
  rescue = "linux64"
  location = "fsn1"
  ssh_keys = [hcloud_ssh_key.default.id] 
  server_type = "cx41"
  labels = {
    app = "worker"
    lb = "ingress"
  }
}

