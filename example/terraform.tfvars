# Example terraform.tfvars for local development.
# Copy this file and replace placeholder values with your own.

resource_group_name = "rg-budget-demo"
location            = "eastus"
cost_center         = "engineering"
notification_emails = ["engineering@pick2solutions.com"]
budget_start_date   = "2025-01-01"
