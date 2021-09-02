data "terraform_remote_state" "random_pet" {
  backend = "remote"

  config = {
    organization = "vivien-paid-org"
    workspaces = {
      name = "random-pet"
    }
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo The pet name from remote_state is ${data.terraform_remote_state.random_pet.outputs.random_pet}"
  }
}

