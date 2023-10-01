class_name Resources extends Node

@export var resource_name : String
@export var description : String
@export var negative_amount_possible : bool
@export var has_resource_cap : bool
@export var resource_cap : int
@export var amount : int
@export var is_sellable : bool
@export var buy_value : float
@export var sell_value : float

func increase_amount(increase : int) -> void:
	if !resource_cap or (amount+increase) < resource_cap:
		amount = amount + increase
	else:
		amount = resource_cap
	
func decrease_amount(decrease: int) -> void:
	if decrease < amount or negative_amount_possible:
		amount = amount - decrease
	else:
		amount = 0
