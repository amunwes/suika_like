extends Control

@export var load_scene : PackedScene
# Called when the node enters the scene tree for the first time.

func _on_start_pressed():
	get_tree().change_scene_to_packed(load_scene)	


func _on_quit_pressed():
	get_tree().quit() # Replace with function body.
