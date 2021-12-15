resource "hcloud_load_balancer" "api"{
  name = "api_loadbalancer_tf"
  load_balancer_type = "lb11"
  location = "fsn1"
}

resource "hcloud_load_balancer" "ingress"{
  name = "ingress_loadbalancer_tf"
  load_balancer_type = "lb11"
  location = "fsn1"
}

resource "hcloud_load_balancer_target" "api"{
  load_balancer_id = hcloud_load_balancer.api.id
  type = "label_selector"
  label_selector = "lb = api"
}

resource "hcloud_load_balancer_target" "ingress"{
  load_balancer_id = hcloud_load_balancer.ingress.id
  type = "label_selector"
  label_selector = "lb = ingress"
}

resource "hcloud_load_balancer_service" "api_lb_service-6443"{
  load_balancer_id = hcloud_load_balancer.api.id
  protocol = "tcp"
  listen_port = 6443
  destination_port = 6443
}

resource "hcloud_load_balancer_service" "api_lb_service-80"{
  load_balancer_id = hcloud_load_balancer.api.id
  protocol = "tcp"
  listen_port = 80
  destination_port = 80

}

resource "hcloud_load_balancer_service" "ingress_lb_service-443"{
  load_balancer_id = hcloud_load_balancer.ingress.id
  protocol = "tcp"
  listen_port = 443
  destination_port = 443
}

resource "hcloud_load_balancer_service" "ingress_lb_service-22623"{
  load_balancer_id = hcloud_load_balancer.ingress.id
  protocol = "tcp"
  listen_port = 22623
  destination_port = 22623
}
