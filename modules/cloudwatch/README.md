## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cloudwatch_event_name | Set cloudwatch event name | string | - | yes |
| function_name | Set function name | string | - | yes |
| schedule |  | string | `Set schedule` | no |
| target_arn | Target arn | string | - | yes |
| target_id | Set target id | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws_cloudwatch_event_rule_arn |  |


## Example

```sh
module "cloudwatch" {
  source = "../../modules/cloudwatch"
  cloudwatch_event_name = "UpsideDown"
  schedule              = "cron(0/10 * * * ? *)"
  target_id = "UpsideDown"
  target_arn = "${module.lambda.function_arn}"
  function_name = "${module.lambda.function_name}"
}
```

License
----

Copyright 2018 EmpathyBroker

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
   
http://www.apache.org/licenses/LICENSE-2.0
   
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and limitations under the License.