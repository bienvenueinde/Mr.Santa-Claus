extends Button


func _ready():
	pass


func _on_aide_button_down():
	get_tree().change_scene("res://scenes/aide.tscn")
