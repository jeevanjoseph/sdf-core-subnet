# Sample - parameterized

## Files
* `terraform.tfvars`
  * User credentials, stuff that shouldn't be committed to git repo
* `env-prod.tfvars`
  * The environment variables used for the production environment.  Must be passed in via CLI with `--vars-file=env-prod.tfvars` if you want to use this file.
* `env-test.tfvars`
  * The environment variables used for the test environment.  Must be passed in via CLI with `--vars-file=env-test.tfvars` if you want to use this file.
* `variables.tf`
  * Defaults are not set here, because we don't want to inadvertently set the wrong environment variables...


## Advantages
* Users cannot accidentally alter an environment without passing in specific variable values
* Guarantees the same topology for multiple environments

## Disadvantages
* Requires user to always pass correct environment file parameter
* Workspaces must be used (because it's not all being managed under the same tfstate file)
* Lots of duplication between module and what I as a consumer of the module must do to instantiate the module
* The consumer (user) must be defined by the user (it's pretty involved and complex)
  * The user must thoroughly understand a relatively complex module, and the nuances of HCL.
  * main.tf is complex and unwieldy
  * variables.tf is verbose - lots of variables
