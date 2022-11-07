extends CanvasLayer

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateInfo():
	get_node("Title").text = ItemName
	get_node("Des").text = ItemDes + "\nCost: " + str(ItemCost)

func _on_close_pressed():
	get_node("Anim").play("TransOut")
	get_node("../").process_mode = Node.PROCESS_MODE_ALWAYS

func _on_use_pressed():
	for i in Global.inventory:
		if Global.inventory[i]["Name"] == ItemName:
			ItemCount -= 1
			if ItemCount == 0:
				#Remove item from inventory, then update the inventory 
				var tempDic = {}
				for x in Global.inventory:
					if x > i:
						tempDic[x-1] = Global.inventory[x]
					elif x < i:
						tempDic[x] = Global.inventory[x]
				Global.inventory.clear()
				Global.inventory = tempDic
				_on_close_pressed()
			else:
				Global.inventory[i]["Count"] -= 1
			get_node("../InvContainer").fillInventorySlots()
	print(Global.inventory)
