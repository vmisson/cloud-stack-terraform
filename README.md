# Cloud Stack Terraform

This is the Terraform code of my own application stack based on Azure Cloud. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- Active Azure subscription : https://portal.azure.com/
- Azure CLI : https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
- Terraform : https://www.terraform.io/downloads.html

### Installing

You will have to clone the repo and instantiate the different infrastructure part one by one in the correct order.

```
git clone https://github.com/vmisson/cloud-stack-terraform.git
cd cloud-stack-terraform/infrastructure
terraform apply
cd ../network
terraform apply
cd ../storage
terraform apply
cd ../compute
terraform applu
```

Wait for few minutes and must have your stack fully ready to be used. 

## Deployment

Add additional notes about how to deploy this on a live system

## Contributing [TBD]

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning [TBD]

## Authors

* **Vincent Misson** - *Initial work* - [vmisson](https://github.com/vmisson)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License [TDB]

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
