## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cron | Set to true if a crontab is needed | string | `false` | no |
| description |  | string | `` | no |
| description_production_alias | Set a description | string | `A production alias` | no |
| description_staging_alias | Set a description | string | `A staging alias` | no |
| description_test_alias | Set a description | string | `A test alias` | no |
| environment | Environment configuration for the Lambda function | map | `<map>` | no |
| filename | Set path to zip file | string | - | yes |
| function_name |  | string | `lambda_function` | no |
| handler |  | string | `lambda_function.handler` | no |
| memory_size | Set memory size | string | `128` | no |
| policy_list | Set policy list to load extra policies | string | `<list>` | no |
| policy_path | Set role path to load extra roles to the lambda functions | string | `` | no |
| production_alias_version | Set version | string | `1` | no |
| publish | Set true for publish version | string | `false` | no |
| runtime |  | string | `python3.6` | no |
| schedule | Set scheduled | string | `` | no |
| security_group_ids |  | list | `<list>` | no |
| staging_alias_version | Set version | string | `1` | no |
| subnet_ids |  | list | `<list>` | no |
| tags | You can use tags to group and filter your functions | map | `<map>` | no |
| test_alias_version | Set version | string | `$LATEST` | no |
| timeout | timeout info | string | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| function_arn | The ARN of the Lambda function |
| function_name | The name of the Lambda function |
| role_arn | The ARN of the IAM role created for the Lambda function |
| role_name | The name of the IAM role created for the Lambda function |


## Example 
```sh
module "lambda" {
  source = "../../terraform-module/lambda"
  policy_path = "policies/policy.json"
  policy_list = ["arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess"]
  function_name = "OperationMirkwood"
  handler       = "access"
  timeout       = "3"
  filename      = "./code/access.zip"
  runtime       = "go1.x"
   environment {
    variables = {
      HAZARD= "Demogorgon"
      CHANNEL = "#madmax"
      GUARD = "Eleven"
      ICON = ":key:"
    }
  }
  tags {
    environment = "Hawkins National Laboratory"
  }
}
``` 

 
License
----

Copyright 2018 EmpathyBroker

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
   
http://www.apache.org/licenses/LICENSE-2.0
   
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and limitations under the License.