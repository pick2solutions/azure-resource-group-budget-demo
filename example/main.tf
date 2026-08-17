module "resource_group_budget" {
  source = "../"

  resource_group_name = var.resource_group_name
  location            = var.location
  cost_center         = var.cost_center
  notification_emails = var.notification_emails
  budget_start_date   = var.budget_start_date
}
