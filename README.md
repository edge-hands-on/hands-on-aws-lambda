# hands-on-aws-lambda
AWS Lambda Hands-on

Configuring AWS
In order to follow the best practices, let’s create a user for Terraform. Go to your AWS console and create terraform_user user:
![terraform_user](./imgs/img01.png "Adding user")

Give it the good rights. In my example, I need Terraform to be able to manage all of my AWS Cloud resources:
![AdministratorAccess](./imgs/img02.png "Add AdministratorAccess to terraform_user")

Don’t forget to store the AWS access key id and secret access key:
![copy access key and secret](./imgs/img03.png "Access key and secret")
