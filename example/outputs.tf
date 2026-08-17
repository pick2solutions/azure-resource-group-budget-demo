output "resource_group_id" {
  description = "The ID of the created resource group."
  value       = module.resource_group_budget.resource_group_id
}

output "resource_group_name" {
  description = "The name of the created resource group."
  value       = module.resource_group_budget.resource_group_name
}

output "budget_id" {
  description = "The ID of the consumption budget."
  value       = module.resource_group_budget.budget_id
}
