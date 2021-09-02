data "terraform_remote_state" "random_pet" {
  backend = "remote"

  config = {
    organization = "YOUR-ORGANISATION-NAME"
    workspaces = {
      name = "YOUR-WORKSPACE-NAME"
    }
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo The pet name from remote_state is ${data.terraform_remote_state.random_pet.outputs.random_pet}"
  }
}

