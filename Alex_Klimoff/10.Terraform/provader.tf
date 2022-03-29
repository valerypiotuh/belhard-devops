provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = var.server_uri
    pm_user = var.server_user
    pm_password = var.server_pass
}

