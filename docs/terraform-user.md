# Create AWS user for Terraform

1. Go to https://console.aws.amazon.com/iam/home#/users and create terraform_user user:
![terraform_user](../imgs/img01.png "Adding user")

2. Give it the rights to manage the resources you need. In the example below it has AdministratorAccess:
![AdministratorAccess](../imgs/img02.png "Add AdministratorAccess to terraform_user")

3. Don’t forget to store the AWS access key id and secret access key:
![copy access key and secret](../imgs/img03.png "Access key and secret")
