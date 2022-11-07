extends GridContainer


@onready var item = preload("res://Slot.tscn")
var invSize = 24

func _ready():
	#Load Slots in
	for i in invSize:
		var itemTemp = item.instantiate()
		add_child(itemTemp)
		
	#Fill in items into slots
	fillInventorySlots()
	
func fillInventorySlots():
	#Empty all the slots of their items
	for i in invSize:
		get_child(i).ItemName = ""
		get_child(i).ItemDes = ""
		get_child(i).ItemCost = ""
		get_child(i).ItemCount = 0
		get_child(i).hasItem = false
	#Fills in inv => slots
	for i in Global.inventory:
		get_child(i).ItemName = Global.inventory[i]["Name"]
		get_child(i).ItemDes = Global.inventory[i]["Des"]
		get_child(i).ItemCost = Global.inventory[i]["Cost"]
		get_child(i).ItemCount = Global.inventory[i]["Count"]
		get_child(i).get_node("Icon").texture = (Global.inventory[i]["Icon"])
		get_child(i).hasItem = true
		
