extends OptionButton

export var themes = [
	"res://Resources/solarizod_theme.tres",
	"res://Resources/godot_theme.tres"]

func _ready():
#	for path in themes:
#		add_item(path.find..., id) 
	add_item("Solarized",0) 
	add_item("Godot", 1) 

func _on_OptionButton_item_selected(id):
	get_tree().root.get_child(0).theme = load(themes[id])
