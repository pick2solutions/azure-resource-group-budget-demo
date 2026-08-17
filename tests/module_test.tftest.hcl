# Terraform test for the resource-group-budget module.
# These tests use `terraform test` (Terraform >= 1.6) with mock providers
# so they can run without real Azure credentials.

mock_provider "azurerm" {}

run "resource_group_created_with_cost_center_tag" {
  variables {
    resource_group_name = "rg-test"
    location            = "eastus"
    cost_center         = "engineering"
    notification_emails = ["test@example.com"]
    budget_start_date   = "2025-01-01"
  }

  assert {
    condition     = azurerm_resource_group.this.name == "rg-test"
    error_message = "Resource group name does not match."
  }

  assert {
    condition     = azurerm_resource_group.this.location == "eastus"
    error_message = "Resource group location does not match."
  }

  assert {
    condition     = azurerm_resource_group.this.tags["CostCenter"] == "engineering"
    error_message = "CostCenter tag is not set correctly."
  }
}

run "budget_amount_and_thresholds" {
  variables {
    resource_group_name = "rg-test"
    location            = "eastus"
    cost_center         = "engineering"
    notification_emails = ["test@example.com"]
    budget_start_date   = "2025-01-01"
    budget_amount       = 100
  }

  assert {
    condition     = azurerm_consumption_budget_resource_group.this.amount == 100
    error_message = "Budget amount should be 100."
  }

  assert {
    condition     = length(azurerm_consumption_budget_resource_group.this.notification) == 4
    error_message = "Expected 4 budget notification thresholds (25, 50, 75, 90)."
  }
}

run "custom_budget_name" {
  variables {
    resource_group_name = "rg-test"
    location            = "eastus"
    cost_center         = "engineering"
    notification_emails = ["test@example.com"]
    budget_start_date   = "2025-01-01"
    budget_name         = "my-custom-budget"
  }

  assert {
    condition     = azurerm_consumption_budget_resource_group.this.name == "my-custom-budget"
    error_message = "Budget name does not match the custom value."
  }
}
