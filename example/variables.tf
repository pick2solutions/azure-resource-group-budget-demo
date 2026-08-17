variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "rg-budget-demo"
}

variable "location" {
  description = "The Azure region for the resource group."
  type        = string
  default     = "eastus"
}

variable "cost_center" {
  description = "Cost center tag value."
  type        = string
  default     = "engineering"
}

variable "notification_emails" {
  description = "Email addresses for budget alerts."
  type        = list(string)
  default     = ["engineering@pick2solutions.com"]
}

variable "budget_start_date" {
  description = "Budget start date (YYYY-MM-DD, must be first of a month)."
  type        = string
  default     = "2025-01-01"
}
