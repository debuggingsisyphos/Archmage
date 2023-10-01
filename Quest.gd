class_name Quest extends Node

@export var quest_reward : QuestReward
@export var quest_objective : QuestObjective 
@export var quest_holder : QuestHolder
@export var quest_description : String
@export var quest_name : String

func accept_quest() -> void:
	pass
	
func decline_quest() -> void:
	pass
	
func drop_quest() -> void:
	pass
	
func complete_quest() -> void:
	pass
	
func fail_quest() -> void:
	pass
