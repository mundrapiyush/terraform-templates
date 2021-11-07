provider "cloudinit" {
  
}

data "template_file" "init-config" {
    template = file("scripts/init.cfg")
    vars = {
      "REGION" = var.AWS_REGION
    }
}

data "template_file" "init-script" {
    template = file("scripts/volumes.sh")
    vars = {
      "DEVICE" = var.VOLUME_NAME
    }
}

data "template_cloudinit_config" "cloudinit_config" {
    gzip = false
    base64_encode = false

    part {
        filename = "init.cfg"
        content_type = "text/cloud-config"
        content = data.template_file.init-config.rendered
    }

    part {
        filename = "volumes.sh"
        content_type = "text/x-shellscript"
        content = data.template_file.init-script.rendered
    }  
}

