variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the resource group."
  type        = string
}

variable "cost_center" {
  description = "Cost center tag value applied to the resource group."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the resource group."
  type        = map(string)
  default     = {}
}

variable "budget_name" {
  description = "The name of the consumption budget."
  type        = string
  default     = "resource-group-budget"
}

variable "budget_amount" {
  description = "The total amount of cost to track with the budget (USD)."
  type        = number
  default     = 100
}

variable "budget_start_date" {
  description = "The start date for the budget in YYYY-MM-DD format (must be the first of a month)."
  type        = string
}

variable "budget_end_date" {
  description = "The end date for the budget in YYYY-MM-DD format."
  type        = string
  default     = null
}

variable "notification_emails" {
  description = "List of e-mail addresses that receive budget alert notifications."
  type        = list(string)
}
