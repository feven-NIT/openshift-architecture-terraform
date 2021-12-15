resource "hcloud_ssh_key" "default" {
  name = "hetzner-key"
  public_key = file("./auth/ssh-key.pub")
}
