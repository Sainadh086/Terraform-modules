# Terraform Modules

Modules are a way to organize your Terraform configuration in a way that is easy to reuse.

Using modules is a great way to reduce the amount of configuration you need to write, and to make your Terraform configuration easier to manage.

## Modules Usage
    - simple main.tf file
        - module "module_name" {
            source = "./module_name" # path to the module, can be any url or local folder path
            #write required variables here
            }
        - providers.tf # file for the provider
    Apply terraform commands.

Here I will upload the modules which helps to improve the workflow and to reduce the deployment time.


Feel free to use the modules in your own projects, share your feedback for fine tuning and improve the modules.

Adding EKS module soon