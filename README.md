# azure-resource-group-budget-demo

A Terraform module that creates an Azure Resource Group with a **Cost Center** tag and a pre-configured consumption budget attached to that resource group.

## Features

- Creates an `azurerm_resource_group` with a configurable `CostCenter` tag.
- Attaches an `azurerm_consumption_budget_resource_group` with a **$100 monthly budget** (configurable).
- Sends alert notifications at **25 %, 50 %, 75 %, and 90 %** of the budget.
- Notification e-mail addresses are a first-class variable.

## Module inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `resource_group_name` | Name of the Azure resource group | `string` | — | yes |
| `location` | Azure region | `string` | — | yes |
| `cost_center` | Value for the `CostCenter` tag | `string` | — | yes |
| `notification_emails` | List of e-mail addresses for budget alerts | `list(string)` | — | yes |
| `budget_start_date` | Budget start date (`YYYY-MM-DD`, must be the 1st of a month) | `string` | — | yes |
| `budget_name` | Name of the consumption budget resource | `string` | `"resource-group-budget"` | no |
| `budget_amount` | Budget amount in USD | `number` | `100` | no |
| `budget_end_date` | Budget end date (`YYYY-MM-DD`) | `string` | `null` | no |
| `tags` | Additional tags to apply to the resource group | `map(string)` | `{}` | no |

## Module outputs

| Name | Description |
|------|-------------|
| `resource_group_id` | ID of the created resource group |
| `resource_group_name` | Name of the created resource group |
| `resource_group_location` | Location of the created resource group |
| `budget_id` | ID of the consumption budget |

## Usage

```hcl
module "resource_group_budget" {
  source = "github.com/pick2solutions/azure-resource-group-budget-demo"

  resource_group_name = "rg-my-app"
  location            = "eastus"
  cost_center         = "engineering"
  notification_emails = ["engineering@pick2solutions.com"]
  budget_start_date   = "2025-01-01"
}
```

See the [`example/`](./example) directory for a complete working example.

## Running the example

```bash
cd example
terraform init
terraform plan
terraform apply
```

## Running tests

Terraform native tests require **Terraform >= 1.6** and run with mock providers (no real Azure credentials needed):

```bash
terraform test
```

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| azurerm | ~> 4.0 |
