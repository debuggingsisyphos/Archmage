class_name ResourceManagement extends Node


@export var economic_actors : Array

func exchange_resource(seller : ResourceOwner, buyer : ResourceOwner, sold_resource : Resources, payed_resource : Resources) -> void:
	if seller.owns_sufficient_resources(sold_resource) and buyer.owns_sufficient_resources(payed_resource):
		seller.give_resource(sold_resource)
		seller.receive_resource(payed_resource)
		buyer.give_resource(payed_resource)
		buyer.receive_resource(sold_resource)
	else:
		print("Not sufficient resources, implement signal please")
