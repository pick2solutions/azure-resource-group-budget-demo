resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = merge(
    { CostCenter = var.cost_center },
    var.tags
  )
}

locals {
  alert_thresholds = [25, 50, 75, 90]
}

resource "azurerm_consumption_budget_resource_group" "this" {
  name              = var.budget_name
  resource_group_id = azurerm_resource_group.this.id

  amount     = var.budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = var.budget_start_date
    end_date   = var.budget_end_date
  }

  dynamic "notification" {
    for_each = local.alert_thresholds

    content {
      enabled        = true
      threshold      = notification.value
      operator       = "GreaterThan"
      threshold_type = "Actual"

      contact_emails = var.notification_emails
    }
  }
}
