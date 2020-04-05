# Create AWS user for Terraform

1. Go to https://console.aws.amazon.com/iam/home#/users and create gitlab user:
![gitlab_user](../imgs/img04.png "Adding user")

2. Add the following permission to allow gitlab to update function code:
![update-function-code permission](../imgs/img05.png "Add lambda:UpdateFunctionCode permission")

3. Don’t forget to store the AWS access key id and secret access key:
![copy access key and secret](../imgs/img03.png "Access key and secret")
