class_name ResourceOwner extends Node

@export var owned_resources : Array
# a new class for actors should be created, then the string will be replaced
@export var actor_reference : String

func owns_resource(resource : Resources) -> bool:
	if owned_resources.has(resource): return true
	else: return false

func owns_sufficient_resources(resource : Resources) -> bool:
	if owns_resource(resource):
		if get_resource(resource.resource_name).amount >= resource.amount: return true
	return false
		
func get_resource(resource_name : String) -> Resources:
	for resource in owned_resources:
		if resource.resource_name == resource_name: return resource
	return null
	
func receive_resource(resource : Resources) -> void:
	pass
	
func give_resource(resource : Resources) -> void:
	pass
