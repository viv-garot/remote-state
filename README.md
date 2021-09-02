# Description
Learn how to use terraform_remote_state with TFC remote backend


## Pre-requirements

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 
* [Terraform cli](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [TFC account](http://app.terraform.io). Basic knowledge of Terraform Cloud (how to create a workspace, link a github repo, queue a plan and apply)
* [GitHub VCS provider configured in TFC](https://www.terraform.io/docs/cloud/vcs/github.html)

## How to use this repo

- Import viv-garot/random_pet repo in GitHub
- Create a new TFC workspace
- Clone this repo
- Cleanup

---

## Import

[Import](https://github.com/new/import) (or fork) [viv-garot/random-pet](https://github.com/viv-garot/random-pet) into your GitHub account 

![image](https://user-images.githubusercontent.com/85481359/131845066-2a5109f1-86b6-4017-a3a9-aae24df1b4fa.png)


## Create a new Terraform Cloud workspace

* Create a new workspace in TFC, Version Control workflow, GitHub VCS and select your previously created repository

![image](https://user-images.githubusercontent.com/85481359/131845617-f82a18b2-7987-48d4-9d47-115aada1d43f.png)


* Queue a plan and apply

![image](https://user-images.githubusercontent.com/85481359/131845731-cd25bf79-83ee-4b6c-8be4-e44590317fcc.png)



### Clone the repo

```
git clone https://github.com/viv-garot/remote-state
```

### Change directory

```
cd remote-state
```

### Update main.tf

In the main.tf update the below content with your previously created TFC workspace details

```
  config = {
    organization = "YOUR-ORGANIZATION-NAME"
    workspaces = {
      name = "YOUR-WORKSPACE-NAME"
    }
  }
}
```

### Run

* Init:

```
terraform init
```

_sample_:

```
terraform init

Initializing the backend...

Initializing provider plugins...
- terraform.io/builtin/terraform is built in to Terraform
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.1.0...
- Installed hashicorp/null v3.1.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

* Apply:

```
terraform apply
```

_sample_:

```
terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.null will be created
  + resource "null_resource" "null" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.null: Creating...
null_resource.null: Provisioning with 'local-exec'...
null_resource.null (local-exec): Executing: ["/bin/sh" "-c" "echo The pet name from remote_state is direct-bird"]
null_resource.null (local-exec): The pet name from remote_state is direct-bird
null_resource.null: Creation complete after 0s [id=7830491471513956751]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
