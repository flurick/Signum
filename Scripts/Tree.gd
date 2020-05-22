extends Tree

var root:TreeItem


func _ready():
	root = create_item()
	set_column_title(0,"node")
#	set_hide_root(true)
#	connect("item_selected", self, "_on_Tree_item_selected")


func _gui_input(event):
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_TAB:
				accept_event()
				indent()
			KEY_BACKSPACE:
				accept_event()
				remove()

func indent(): #selected into previous in tree 
	if get_selected().get_prev():
		var target_item_parent = get_selected().get_prev()
		var target_item = get_selected()
		var new_target_item = create_item(target_item_parent)
		new_target_item.set_text(0, target_item.get_text(0))
		target_item.get_parent().remove_child(target_item)
		new_target_item.set_editable(0, true)

#func move(node, new_parent): #selected
#	pass

func remove():
	if get_selected() and get_selected().get_parent() and get_selected()!=root:
		get_selected().get_parent().remove_child(get_selected())

func insert(): #into selected parent
	print("new")
	var new_item
	if get_selected():
		new_item = create_item( get_selected() )
	else:
		new_item = create_item()
	new_item.set_text(0, "p")
	new_item.set_editable(0, true)


func _on_Button_pressed():
	insert()

func _on_Button2_pressed():
	indent()

func _on_Button3_pressed():
	remove()
