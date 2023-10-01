class_name QuestObjective extends Node

@export var mandatory_tasks : Array
@export var optional_tasks : Array

func get_completed_tasks() -> Array:
	return []
	
func get_uncompleted_tasks() -> Array:
	return []
	
func all_tasks_completed() -> bool:
	return false 
