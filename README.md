# How to use Terraform, Go, AWS Lambda and Slack to monitor the age of your AWS credentials. 

The aim of this project is explain how to notify AWS users when they need to rotate their credentials to be under an imposed age limit.
You can read in more detail in the next [article](link to medium)

# Requisites
* Terraform v0.11.7
* Terragrunt v0.14.2
* An AWS-account-ID
* Slack-Webhook-URL

# Getting started 

## Lambda function code

The lambda function has been done in Golang. We don't include the zip code but you can generate it executing the [access.sh](https://github.com/EmpathyBroker/aws-credentials-monitoring/blob/master/live/stranger-things/code/access.sh)

## Terraform instructions 

From the path ./stranger-things. We should do the following to deploy the infrastructure: 
    
```sh
$ aws-vault exec <profile> -- terragrunt plan -out=fit.plan
$ aws-vault exec <profile> -- terragrunt apply fit.plan
```    

This create us the infrastructure defined in the [main.tf](https://github.com/EmpathyBroker/aws-credentials-monitoring/blob/master/live/stranger-things/main.tf)

License
----

Copyright 2018 EmpathyBroker

 Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
   
http://www.apache.org/licenses/LICENSE-2.0
   
 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and limitations under the License.
